#!/bin/sh
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

# If fonts directory doesn't exist, extract from font.zip / fonts.zip
if [ ! -d "$DIR/fonts" ]; then
    if [ -f "$DIR/font.zip" ]; then
        echo "Extracting font.zip..."
        unzip -q -o "$DIR/font.zip" -d "$DIR" 2>/dev/null || python3 -m zipfile -e "$DIR/font.zip" "$DIR" 2>/dev/null || tar -xf "$DIR/font.zip" -C "$DIR"
    elif [ -f "$DIR/fonts.zip" ]; then
        echo "Extracting fonts.zip..."
        unzip -q -o "$DIR/fonts.zip" -d "$DIR" 2>/dev/null || python3 -m zipfile -e "$DIR/fonts.zip" "$DIR" 2>/dev/null || tar -xf "$DIR/fonts.zip" -C "$DIR"
    fi
fi

chmod +x "$DIR/install_fonts.bin" 2>/dev/null || true
chmod +x "$DIR/fonts/install_fonts.bin" 2>/dev/null || true

if [ -x "$DIR/install_fonts.bin" ]; then
    exec "$DIR/install_fonts.bin" "$@"
elif [ -x "$DIR/fonts/install_fonts.bin" ]; then
    exec "$DIR/fonts/install_fonts.bin" "$@"
else
    # Fallback shell installation if binary not present or architecture mismatch
    echo "Installing fonts to ~/.local/share/fonts/..."
    TARGET_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts"
    mkdir -p "$TARGET_DIR"
    if [ -d "$DIR/fonts" ]; then
        cp -n "$DIR/fonts"/*.ttf "$DIR/fonts"/*.otf "$TARGET_DIR/" 2>/dev/null || true
    fi
    fc-cache -f "$TARGET_DIR" 2>/dev/null || true
    echo "All fonts installed successfully!"
fi
