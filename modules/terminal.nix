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
      alias s='shutdown now'
      alias c='clear'
      alias cat="bat"
      alias re='reboot'
      alias ga='git add .'
      alias gcl='git clone'
      alias gpl ='git pull origin main'
      alias gc ='git checkout -b'
      alias gm ='git commit -m'
      alias gp ='git push origin'
    '';
  };

  programs.command-not-found.enable = true;
}
