{ pkgs, ... }:

{
  imports = [ ./gnome ./programs ];

  home = {
    # Same as `system.stateVersion` (see `configuration.nix`).
    stateVersion = "23.05";
    username = "sebastian";
    homeDirectory = "/home/sebastian";

    packages = with pkgs; [
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
      gnomeExtensions.forge
      gnomeExtensions.rounded-window-corners
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
  };
}
