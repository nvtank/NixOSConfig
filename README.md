# NixOS Configuration

A modular and comprehensive NixOS configuration managed with **Flakes**. This setup is designed for a modern development environment with a focus on web, mobile, and system programming, running on a GNOME desktop.

## 🚀 Overview

- **OS:** NixOS 25.11
- **Hostname:** `nixos`
- **Architecture:** `x86_64-linux`
- **Window Manager:** GNOME (Wayland/X11)
- **Shell:** Zsh + Starship
- **Timezone:** Asia/Ho_Chi_Minh

## 📂 Project Structure

The configuration is split into modular files for better maintainability:

```
/etc/nixos/
├── flake.nix              # Flake entry point (inputs/outputs)
├── configuration.nix      # Main system configuration & imports
├── hardware-configuration.nix # Hardware specific settings (auto-generated)
└── modules/               # Categorized configuration modules
    ├── base.nix           # System basics (Timezone, Bluetooth, Network)
    ├── common.nix         # Common utilities (implied)
    ├── desktop.nix        # GNOME, GDM, PipeWire, Flatpak
    ├── dev.nix            # Docker, Android Studio, ADB, Git, Direnv
    ├── maintenance.nix    # System maintenance tasks (gc, upgrades)
    ├── packages.nix       # System-wide packages (Editors, Browsers, Runtimes)
    ├── shell.nix          # Zsh configuration (Aliases, Plugins)
    ├── terminal.nix       # Terminal emulator settings (Kitty)
    ├── ui.nix             # Fonts, Icons, Theming
    ├── user.nix           # User definition (nvtank)
    └── vietnamese.nix     # Fcitx5 + Bamboo input method
```

## ✨ Features

### 🖥️ Desktop & UI
- **Environment:** GNOME Desktop Manager (GDM) + GNOME.
- **Audio:** PipeWire (PulseAudio/ALSA compatibility enabled).
- **Fonts:** JetBrainsMono Nerd Font, Noto Fonts.
- **Theming:** Papirus Icon Theme, Bibata Cursors.
- **Input:** Vietnamese support via `fcitx5-bamboo`.

### 🛠️ Development Environment
- **Languages:** 
  - Node.js 20 + pnpm
  - Python 3 + pip + virtualenv
  - Java 17 + Maven + Gradle
  - Go + gopls
  - C/C++ (GCC, GDB, CMake, Ninja, Clang-tools)
- **Tools:** VS Code, Neovim, Git, Docker, Android Studio.
- **Shell Enhancements:** `starship`, `zoxide`, `fzf`, `eza` (ls replacement), `bat` (cat replacement), `ripgrep`.

### ⚡ Terminal
- **Emulator:** Kitty (Configured with JetBrainsMono NF, semi-transparent background).
- **Shell:** Zsh configured with syntax highlighting, autosuggestions, and custom aliases (`ls` -> `eza`, `cat` -> `bat`).

## 📦 Installation & Usage

### 1. Clone & Setup
Clone this repository to your NixOS configuration directory (usually `/etc/nixos`).

### 2. Update System
To apply changes, run the following command:

```bash
sudo nixos-rebuild switch --flake .#nixos
```

### 3. Update Inputs
To update the flake inputs (e.g., `nixpkgs`):

```bash
nix flake update
```

## 👤 User

- **Username:** `nvtank`
- **Groups:** `wheel` (sudo), `networkmanager`, `docker`, `adbusers`.

---
*Generated automatically for documentation purposes.*
