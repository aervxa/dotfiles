#!/usr/bin/env bash

image="$1"

if [ -z "$image" ]; then
    echo "no image provided"
    exit 1
fi

matugen image "$image"
cp "$image" "$HOME/.current_wallpaper"
