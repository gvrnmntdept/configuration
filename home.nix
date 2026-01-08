{ config, pkgs, ... }:

{
  home.username = "vsevolod";
  home.homeDirectory = "/Users/vsevolod";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    python3
    nodejs_24
    go
  ];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
  };

  programs.git = {
    enable = true;
    settings = {
      user.email = "filinov.vsevolod@gmail.com";
      user.name = "Vsevolod Filinov";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g mouse on
      set -g history-limit 20000
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Ensure ~/.config is managed in a standard way
  xdg.enable = true;

  # Symlink your Neovim config file into ~/.config/nvim/init.lua
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
}
