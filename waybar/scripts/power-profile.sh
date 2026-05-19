#!/bin/bash
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket

profile_names=("power-saver" "balanced" "performance")
icons=("󰾆" "󰾅" "󰓅")
tooltips=("省电 — CPU 低频" "平衡 — 按需调频" "性能 — 全核高频")
classes=("power-saver" "balanced" "performance")

get_index() {
    for i in "${!profile_names[@]}"; do
        [[ "${profile_names[$i]}" == "$1" ]] && echo "$i" && return
    done
    echo 1
}

get_profile() {
    /usr/bin/dbus-send --system --print-reply \
        --dest=org.freedesktop.UPower.PowerProfiles \
        /org/freedesktop/UPower/PowerProfiles \
        org.freedesktop.DBus.Properties.Get \
        string:org.freedesktop.UPower.PowerProfiles \
        string:ActiveProfile 2>/dev/null \
        | grep -oP 'string "\K[^"]+' || echo "balanced"
}

set_profile() {
    /usr/bin/dbus-send --system --print-reply \
        --dest=org.freedesktop.UPower.PowerProfiles \
        /org/freedesktop/UPower/PowerProfiles \
        org.freedesktop.DBus.Properties.Set \
        string:org.freedesktop.UPower.PowerProfiles \
        string:ActiveProfile \
        variant:string:"$1" &>/dev/null
}

# Click handling (waybar passes action via args)
if [[ "$1" == "next" ]]; then
    cur=$(get_profile)
    idx=$(get_index "$cur")
    next=$(( (idx + 1) % ${#profile_names[@]} ))
    set_profile "${profile_names[$next]}"
elif [[ "$1" == "prev" ]]; then
    cur=$(get_profile)
    idx=$(get_index "$cur")
    prev=$(( (idx - 1 + ${#profile_names[@]}) % ${#profile_names[@]} ))
    set_profile "${profile_names[$prev]}"
fi

# Output JSON for waybar
profile=$(get_profile)
idx=$(get_index "$profile")

echo "{\"text\": \"${icons[$idx]}\", \"tooltip\": \"${tooltips[$idx]}\", \"class\": \"${classes[$idx]}\", \"alt\": \"${profile_names[$idx]}\"}"
