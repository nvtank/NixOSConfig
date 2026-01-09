{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    kitty-themes
    starship
    fzf
    zoxide
    eza
    bat
    fd
    ripgrep
    fastfetch
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      # Starship prompt
      eval "$(${pkgs.starship}/bin/starship init zsh)"

      # fzf keybindings (Ctrl+R)
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh

      # zoxide 
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"

      # eza aliases
      alias ls="eza --icons"
      alias ll="eza -lah --icons"
      alias cat="bat"
    '';
  };

  programs.command-not-found.enable = true;

  # Kitty config hệ thống (áp dụng cho mọi user)
  environment.etc."xdg/kitty/kitty.conf".text = ''
    font_family JetBrainsMono Nerd Font
    font_size 12.0
    background_opacity 0.92
    confirm_os_window_close 0
    enable_audio_bell no
    cursor_shape beam
  '';
}
