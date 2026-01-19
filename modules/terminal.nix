{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fzf
    zoxide
    eza
    bat
    fd
    ripgrep
    starship
    fzf zoxide eza bat fd ripgrep fastfetch
    fastfetch
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      # Starship prompt
      if command -v starship >/dev/null 2>&1; then
        eval "$(starship init zsh)"
      fi

      # fzf keybindings & completion
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh

      # zoxide
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"

      # aliases
      alias ls="eza --icons"
      alias ll="eza -lah --icons"
      alias cat="bat"
    '';
  };

  programs.command-not-found.enable = true;
}
