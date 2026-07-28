#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "🍎 AppleTermuX Installer v1.0"
echo "================================"
echo

echo "[1/5] Checking required packages..."

pkg update -y
pkg install -y git zsh fastfetch curl wget nano

echo ""
echo "[2/5] Installation complete."
echo ""
echo "Thank you for installing AppleTermuX! 🍎"

echo ""
echo "[3/5] Checking internet connection..."

if ! ping -c 1 google.com >/dev/null 2>&1; then
    echo "❌ No internet connection!"
    echo "Please connect to Wi-Fi or Mobile Data and try again."
    exit 1
fi

echo "✅ Internet connection detected."
echo ""

echo "[4/5] Installing Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✅ Oh My Zsh is already installed."
fi

echo ""
