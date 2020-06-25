#!/usr/bin/env bash
set -euo pipefail
autoautorandr(){
    if [[xrandr | grep " connected" | wc -l -gt 1]]; then
      autorandr left
    fi
}
