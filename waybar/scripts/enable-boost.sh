#!/bin/sh
echo 1 > /sys/devices/system/cpu/cpufreq/boost 2>/dev/null || true
