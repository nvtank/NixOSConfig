{ config, pkgs, ... }:

{
  # Cài fzf ở mức system
  environment.systemPackages = with pkgs; [
    fzf
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # Bật fzf Ctrl+R + completion cho zsh
    interactiveShellInit = ''
      # fzf keybindings & completion
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh
    '';
  };

  # đặt zsh làm shell mặc định cho user
  users.users.nvtank.shell = pkgs.zsh;

  programs.command-not-found.enable = true;
}
