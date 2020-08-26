#!/usr/bin/env bash
set -euo pipefail

if xrandr | grep " connected" | wc -l > 2; then
    autorandr left
fi
