{ pkgs, ... }:

{
  imports = [ ./programs ];

  home = {
    # Same as `system.stateVersion` (see `configuration.nix`).
    stateVersion = "23.05";
    username = "sebastian";
    homeDirectory = "/home/sebastian";

    packages = with pkgs; [
      discord # All-in-one cross-platform voice and text chat for gamers
      enpass # A well known password manager
      inter # A typeface specially designed for user interfaces
      atkinson-hyperlegible # Typeface designed to offer greater legibility and readability for low vision readers
      neofetch # A fast, highly customizable system info script
      nixfmt # An opinionated formatter for Nix
      spotify # Play music from the Spotify music service
      aseprite # Animated sprite editor & pixel art tool
      godot_4 # Free and Open Source 2D and 3D game engine
      logseq # A local-first, non-linear, outliner notebook for organizing and sharing your personal knowledge base
      jetbrains.idea-community # Integrated Development Environment (IDE) by Jetbrains, community edition
      gnomeExtensions.appindicator # Adds AppIndicator, KStatusNotifierItem and legacy Tray icons support to the Shell
      gnomeExtensions.rounded-window-corners # Add rounded corners for all windows
      gnomeExtensions.forge # Tiling and window manager for GNOME
      gnome.dconf-editor # GSettings editor for GNOME
      gnome.gnome-boxes # Simple GNOME 3 application to access remote or virtual systems
      ollama # Get up and running with large language models locally
      fd # A simple, fast and user-friendly alternative to find
      delta # A syntax-highlighting pager for git
      (nerdfonts.override {
        fonts = [ "JetBrainsMono" ]; # A typeface made for developers
      }) # Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts
    ];
  };
}
