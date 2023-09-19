{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacritty
    ./bat
    ./dircolors
    ./direnv
    ./enpass
    ./eza
    ./firefox
    ./fish
    ./git
    ./jq
    ./lazygit
    ./neovim
    ./starship
    ./vscode
    ./zoxide
  ];
  programs = { home-manager.enable = true; };

  home.packages = with pkgs; [
    aseprite
    atkinson-hyperlegible
    delta
    discord
    enpass
    fd
    gimp
    gnome.dconf-editor
    gnome.gnome-boxes
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.tiling-assistant
    godot_4
    inter
    jetbrains.idea-community
    logseq
    neofetch

    # I just need the JetBrainsMono font from the Nerd Fonts package.
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    nixfmt
    ollama
    spotify
  ];
}
