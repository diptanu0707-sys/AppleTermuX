#!/data/data/com.termux/files/usr/bin/bash
set -e

clear

echo "=========================================="
echo "🍎 AppleTermuX Installer v2.0"
echo "=========================================="
echo ""

echo "[1/6] Checking internet connection..."

if ! ping -c 1 google.com >/dev/null 2>&1; then
    echo ""
    echo "❌ No internet connection detected!"
    echo "Please connect to Wi-Fi or Mobile Data."
    exit 1
fi

echo "✅ Internet connection detected."
echo ""

echo "[2/6] Updating Termux packages..."
pkg update -y
pkg upgrade -y

echo ""
echo "[3/6] Installing required packages..."
pkg install -y git curl wget zsh fastfetch nano

echo ""
echo "[4/6] Installing Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✅ Oh My Zsh is already installed."
fi

echo ""
echo "[5/6] Installing Powerlevel10k..."

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "✅ Powerlevel10k is already installed."
fi

echo ""
echo "[6/6] Finishing setup..."

echo ""
echo "=========================================="
echo "🎉 AppleTermuX installed successfully!"
echo "=========================================="
echo ""
echo "Run these commands:"
echo ""
echo "  chsh -s zsh"
echo "  p10k configure"
echo ""
echo "Restart Termux to complete setup."
echo ""
echo "🍎 Thank you for using AppleTermuX!"
