#!/usr/bin/env bash

# Path to logo image
IMAGE_PATH="$HOME/.config/fastfetch/logo.png"

clear

if [ -f "$IMAGE_PATH" ]; then
    if command -v kitty &> /dev/null; then
        # 1. Render logo at top grid coordinates
        kitty +kitten icat --place 72x12@21x0 "$IMAGE_PATH" 2>/dev/null || \
        kitty +kitten icat --align center "$IMAGE_PATH" 2>/dev/null
        
        # 2. Move terminal cursor to Row 13, Column 0 so text starts BELOW the image
        tput cup 13 0
    elif command -v chafa &> /dev/null; then
        chafa --size=90x10 --align=center "$IMAGE_PATH"
    fi
fi

# Print text block below image
echo "[D3Y4N4]"
echo "==================================================== (* ~ ~ *) ===================================================="

# System Specs
KERNEL=$(uname -r)
UPTIME=$(uptime -p | sed 's/up //')
PKGS=$(pacman -Qq | wc -l)
MEM="$(free -h | awk '/Mem:/ {print $3}') / $(free -h | awk '/Mem:/ {print $2}')"
USER_HOST="~$USER@$HOSTNAME"

CLR="\033[38;2;180;180;180m"
RST="\033[0m"

# Formatted 2-column layout (spaced for 1366x768 screens)
printf "| ${CLR}󰌽${RST} | distro   %-42s | ${CLR}󰖲${RST} | wm       %-30s\n" "Tacit 1.1.0 x86_64" "Hyprland 0.56.2 (Wayland)"
printf "| ${CLR}󰌾${RST} | kernel   %-42s | ${CLR}󰍛${RST} | memory   %-30s\n" "$KERNEL" "$MEM"
printf "| ${CLR}󰞷${RST} | terminal %-42s | ${CLR}󰅐${RST} | uptime   %-30s\n" "$TERM" "$UPTIME"
printf "| ${CLR}󰍛${RST} | cpu      %-42s | ${CLR}󰏖${RST} | packages %-30s\n" "AMD Athlon Silver 3050U (4) @ 2.30 GHz" "$PKGS (pacman)"
printf "| ${CLR}󰢮${RST} | gpu      %-42s | ${CLR}󰍹${RST} | display  %-30s\n" "AMD Radeon Vega Graphics" "1366x768 in 15\", 60 Hz [Built-in]"
printf "| ${CLR}󰅟${RST} | board    %-42s   %44s\n" "86C1 (89.38)" "$USER_HOST"

echo "==================================================== (* ~ ~ *) ===================================================="

# Color palette dots centered under the text box
C1="\033[38;2;120;140;160m◆\033[0m"
C2="\033[38;2;160;180;200m◆\033[0m"
C3="\033[38;2;210;170;140m◆\033[0m"
C4="\033[38;2;160;200;170m◆\033[0m"
C5="\033[38;2;220;180;180m◆\033[0m"
C6="\033[38;2;230;200;170m◆\033[0m"
C7="\033[38;2;220;130;130m◆\033[0m"

echo -e "                                                  $C1 $C2 $C3 $C4 $C5 $C6 $C7"
echo ""
