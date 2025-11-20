#!/usr/bin/env bash
# ~/.config/hypr/scripts/workspace.sh
# single file: get_ws, move_ws, move_window
# writes debug to /tmp/workspace.log

exec > /tmp/workspace.log 2>&1
set -x

SCRIPT_PATH="$(realpath "$0")"
echo "script: $SCRIPT_PATH"
echo "argv: $*"

# helpers
command_exists() { command -v "$1" >/dev/null 2>&1; }

# Get current workspace id (safe, capped at 9)
get_ws() {
    local max=9
    local current

    if command_exists hyprctl; then
        # try JSON first
        if hyprctl activeworkspace -j >/dev/null 2>&1; then
            current=$(hyprctl activeworkspace -j | jq -r '.id' 2>/dev/null || true)
        fi
        # fallback to plain parse
        if [ -z "$current" ]; then
            current=$(hyprctl activeworkspace 2>/dev/null | awk '{print $3}' || true)
        fi
    else
        echo "hyprctl not found in PATH" >&2
        echo 1
        return
    fi

    # final sanity: integer or default 1
    if ! [[ "$current" =~ ^[0-9]+$ ]]; then
        current=1
    fi

    (( current > max )) && current=$max
    (( current < 1 )) && current=1

    echo "$current"
}

# move to target workspace (absolute)
goto_ws() {
    local target=$1
    hyprctl dispatch workspace "$target"
}

# Move to relative workspace: +1 or -1
move_ws() {
    local delta=$1
    local current
    current=$(get_ws)
    local target=$((current + delta))
    (( target < 1 )) && target=1
    (( target > 9 )) && target=9
    echo "move_ws: current=$current delta=$delta target=$target"
    hyprctl dispatch workspace "$target"
}

# Move focused window to relative workspace
move_window() {
    local delta=$1
    local current
    current=$(get_ws)
    local target=$((current + delta))
    (( target < 1 )) && target=1
    (( target > 9 )) && target=9
    echo "move_window: current=$current delta=$delta target=$target"
    hyprctl dispatch movetoworkspace "$target"
}

# dispatch CLI for the script
case "$1" in
    get_ws) get_ws ;;
    goto) shift; goto_ws "$1" ;;
    move_ws) shift; move_ws "$1" ;;
    move_window) shift; move_window "$1" ;;
    *) 
        echo "usage: $0 {get_ws|goto <n>|move_ws <+/-n>|move_window <+/-n>}"
        exit 1
        ;;
esac
