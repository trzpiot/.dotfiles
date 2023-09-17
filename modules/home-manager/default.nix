{ pkgs, ... }:

{
  imports = [ ./gnome ./packages ];

  home = {
    # Same as `system.stateVersion` (see `configuration.nix`).
    stateVersion = "23.05";
    username = "sebastian";
    homeDirectory = "/home/sebastian";
  };
}
