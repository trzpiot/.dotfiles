{
  imports = [ ./gnome ./packages ./programs ];

  home = {
    # Same as `system.stateVersion` (see `man configuration.nix`).
    stateVersion = "23.05";
    username = "sebastian";
    homeDirectory = "/home/sebastian";
  };
}
