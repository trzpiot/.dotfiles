{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption optionals;
  cfg = config.trzpiot.packages.fonts;

  customPkgs = {
    blexMonoNerdFont = pkgs.nerdfonts.override {
      fonts = [ "IBMPlexMono" ];
    };
    hackNerdFont = pkgs.nerdfonts.override {
      fonts = [ "Hack" ];
    };
    jetBrainsMonoNerdFont = pkgs.nerdfonts.override {
      fonts = [ "JetBrainsMono" ];
    };
  };
in
{
  options.trzpiot.packages.fonts = {
    blexMonoNerdFont.enable = mkEnableOption "BlexMono Nerd Font (IBM Plex Mono)";
    hackNerdFont.enable = mkEnableOption "Hack Nerd Font (Hack)";
    jetBrainsMonoNerdFont.enable = mkEnableOption "JetBrainsMono Nerd Font (JetBrains Mono)";
  };

  config = {
    home.packages = [ ]
      ++ optionals cfg.blexMonoNerdFont.enable [ customPkgs.blexMonoNerdFont ]
      ++ optionals cfg.hackNerdFont.enable [ customPkgs.hackNerdFont ]
      ++ optionals cfg.jetBrainsMonoNerdFont.enable [ customPkgs.jetBrainsMonoNerdFont ];
  };
}
