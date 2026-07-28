#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "🍎 AppleTermuX Installer v1.0"
echo "================================"
echo

echo "[1/5] Checking required packages..."

pkg update -y
pkg install -y git zsh fastfetch curl wget nano
