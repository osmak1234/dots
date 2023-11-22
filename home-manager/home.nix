{ config, pkgs, ... }:

{
  qt.enable = true;

  qt.platformTheme = "gtk";

  qt.style.name = "adwaita-dark";

  qt.style.package = pkgs.adwaita-qt;

  gtk.enable = true;

  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";

  gtk.iconTheme.name = "Gruvbox-Plus-Dark";

  home.username = "user";
  home.homeDirectory = "/home/user";

  imports = [
    ./programs
  ];

  home.stateVersion = "22.11";

  home.packages = with pkgs; [

    gccgo
    docker
    rustup
    bacon
    python3
    bash
    lazygit
    nodejs
    lua
    nodePackages_latest.pnpm
    gh
    curl
    jq
    ripgrep
    jo
    fd
    bat
    bluez
    bluez-tools
    blueman


    dolphin
    dunst
    kitty
    gnome.nautilus
    fish
    starship
    ranger
    neovim
    vimPlugins.LazyVim
    wdisplays
    ncdu
    pavucontrol
    networkmanagerapplet
    rofi-wayland
    eww-wayland
    grim
    slurp
    unzip
    fzf
    waybar

    twemoji-color-font
    libnotify
    nerdfonts

  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
