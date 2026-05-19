#!/bin/bash

windows=$(hyprctl clients -j | jq -r --arg ws "$(hyprctl activeworkspace -j | jq -r '.id')" \
    '.[] | select(.workspace.id == ($ws | tonumber)) | "\(.app_id)|\(.title)|\(.address)"')

# 根据 app_id 映射 emoji
selected=$(echo "$windows" | while IFS='|' read -r app title addr; do
    case "$app" in
        *firefox*) icon="🌐" ;;
        *alacritty*|*kitty*|*foot*|*wezterm*) icon="󰖳" ;;
        *code*) icon="󱃶" ;;
        *nautilus*|*dolphin*) icon="󰉋" ;;
        *discord*) icon="󰙯" ;;
        *spotify*) icon="󰓇" ;;
        *) icon="󰣆" ;;
    esac
    echo "$icon $title|$addr"
done | wofi --dmenu --prompt "󰇄 切换到:" --width 450 --height 400)

addr=$(echo "$selected" | cut -d'|' -f2)
[ -n "$addr" ] && hyprctl dispatch focuswindow address:"$addr"
