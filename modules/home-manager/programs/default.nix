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
    ./gnome
    ./jq
    ./lazygit
    ./neovim
    ./starship
    ./vscode
    ./zoxide
  ];
  programs = { home-manager.enable = true; };
}