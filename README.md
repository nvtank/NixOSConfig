# NixOS + Hyprland end4

![NixOS](https://img.shields.io/badge/NixOS-25.11-5277C3?logo=nixos&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-0.55.0-58E1FF?logo=wayland&logoColor=11111B)
![Quickshell](https://img.shields.io/badge/Quickshell-0.2.1-CBA6F7)

Cấu hình NixOS cá nhân theo hướng **Hyprland + end4-pC**, có bộ gõ tiếng Việt,
workflow dành cho lập trình và đường lui an toàn về GNOME.

> Hyprland là desktop mặc định. GNOME/GDM vẫn được giữ lại để đăng nhập dự
> phòng khi theme, GPU hoặc cấu hình Wayland gặp lỗi.

## Giao diện

![Hyprland end4 desktop](docs/images/hyprland-desktop.png)

Giao diện sử dụng:

- **Hyprland 0.55** làm Wayland compositor.
- **end4-pC** chạy trên **Quickshell 0.2.1** cho bar, launcher, overview,
  notification, wallpaper và Settings.
- `foot` làm terminal mặc định.
- Fcitx5 + Bamboo cho bộ gõ tiếng Việt.
- GDM quản lý đăng nhập và giữ GNOME làm fallback.

## Kiến trúc và đường rollback

![Hyprland stack and rollback flow](docs/images/hyprland-stack.svg)

Các nguồn giao diện được pin trong `flake.lock`, vì vậy rebuild không tự ý lấy
phiên bản end4/Hyprland mới. `end4-setup` chỉ thay hai thư mục:

```text
~/.config/hypr
~/.config/quickshell
```

Trước khi thay, script tạo backup có timestamp tại:

```text
~/.local/state/end4-nixos/backups/
```

## Cài đặt

```bash
git clone git@github.com:nvtank/NixOSConfig.git /etc/nixos
cd /etc/nixos

# Build trước, chưa thay đổi hệ thống đang chạy
nix build .#nixosConfigurations.nixos.config.system.build.toplevel --no-link

# Ghi generation mới và giữ generation cũ trong boot menu
sudo nixos-rebuild switch --flake path:/etc/nixos#nixos

# Chạy bằng user desktop, tuyệt đối không chạy bằng root
end4-setup
```

Sau đó logout và đăng nhập lại. GDM sẽ chọn **Hyprland** mặc định; mật khẩu đăng
nhập vẫn được giữ nguyên.

## Phím tắt chính

![Hyprland keyboard shortcuts](docs/images/hyprland-shortcuts.svg)

| Phím | Tác vụ |
|---|---|
| `Super + Enter` / `Super + T` | Mở terminal |
| `Super + Q` | Đóng cửa sổ |
| `Super + 1…0` | Chuyển thẳng đến workspace |
| `Ctrl + Alt + ←/→` | Workspace trước/sau |
| `Ctrl + \`` | Quay lại workspace vừa dùng |
| `Super + I` | Mở Settings của end4 |
| `Super + /` | Hiện cheatsheet đầy đủ |
| `Super + V` | Clipboard history |
| `Super + Shift + S` | Chụp một vùng màn hình |
| `Ctrl + Alt + Delete` | Menu logout/reboot/power |

Touchpad dùng hướng cuộn tự nhiên (`natural_scroll = true`). Bộ gõ mặc định là
Bamboo và được khởi động riêng khi vào Hyprland.

## Cấu trúc repository

```text
/etc/nixos
├── flake.nix
├── flake.lock
├── configuration.nix
├── hardware-configuration.nix
├── docs/images/
│   ├── hyprland-desktop.png
│   ├── hyprland-stack.svg
│   └── hyprland-shortcuts.svg
└── modules/
    ├── base.nix
    ├── desktop.nix             # GNOME/GDM fallback
    ├── dev.nix
    ├── end4-hyprland.nix       # Hyprland, Quickshell, setup/rollback
    ├── end4-execs.lua          # Autostart riêng cho Hyprland
    ├── end4-keybinds.lua       # Workspace shortcuts
    ├── end4-variables.lua      # end4-pC và Settings IPC
    ├── packages.nix
    ├── shell.nix
    ├── terminal.nix
    ├── ui.nix
    ├── user.nix
    └── vietnamese.nix          # Fcitx5 + Bamboo
```

## Cập nhật an toàn

```bash
cd /etc/nixos
git pull --ff-only

# Luôn build trước
nix build .#nixosConfigurations.nixos.config.system.build.toplevel --no-link

# Chạy thử; reboot sẽ quay lại boot generation cũ
sudo nixos-rebuild test --flake path:/etc/nixos#nixos

# Chỉ switch sau khi đã kiểm tra login, panel và bộ gõ
sudo nixos-rebuild switch --flake path:/etc/nixos#nixos
```

Không chạy `nix flake update` một cách mù quáng: Hyprland, Quickshell,
dots-hyprland và end4-pC được pin để tránh thay đổi API bất ngờ.

## Rollback

### Theme và config người dùng

```bash
end4-rollback
```

Sau đó logout và chọn GNOME trong GDM nếu cần.

### Generation NixOS

- Chọn generation cũ trong boot menu, hoặc
- dùng `sudo nixos-rebuild switch --rollback` từ một phiên còn hoạt động.

Git cũng giữ lịch sử theo từng phase, giúp revert riêng compositor, theme,
input/keybind hoặc bản sửa Settings mà không phải bỏ toàn bộ cấu hình.

## Kiểm tra nhanh

```bash
Hyprland --version
qs --version
hyprctl configerrors
fcitx5-remote -n
systemctl is-active display-manager.service
```

Kết quả mong đợi: Hyprland `0.55.0`, Quickshell `0.2.1`, không có config error,
input method là `bamboo`, và display manager ở trạng thái `active`.
