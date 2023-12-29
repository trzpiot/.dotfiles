{ config, pkgs, lib, ... }:

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

    monaspiceNerdFont = pkgs.nerdfonts.override {
      fonts = [ "Monaspace" ];
    };
  };
in
{
  options.trzpiot.packages.fonts = {
    atkinsonHyperlegible.enable = mkEnableOption "Atkinson Hyperlegible";
    blexMonoNerdFont.enable = mkEnableOption "BlexMono Nerd Font (IBM Plex Mono)";
    hackNerdFont.enable = mkEnableOption "Hack Nerd Font (Hack)";
    inter.enable = mkEnableOption "Inter";
    jetBrainsMonoNerdFont.enable = mkEnableOption "JetBrainsMono Nerd Font (JetBrains Mono)";
    monaspace.enable = mkEnableOption "Monaspace";
    monaspiceNerdFont.enable = mkEnableOption "Monaspice (Monaspace)";
  };

  config = {
    home.packages = [ ]
      ++ optionals cfg.atkinsonHyperlegible.enable [ pkgs.atkinson-hyperlegible ]
      ++ optionals cfg.blexMonoNerdFont.enable [ customPkgs.blexMonoNerdFont ]
      ++ optionals cfg.hackNerdFont.enable [ customPkgs.hackNerdFont ]
      ++ optionals cfg.inter.enable [ pkgs.inter ]
      ++ optionals cfg.jetBrainsMonoNerdFont.enable [ customPkgs.jetBrainsMonoNerdFont ]
      ++ optionals cfg.monaspace.enable [ pkgs.monaspace ]
      ++ optionals cfg.monaspiceNerdFont.enable [ customPkgs.monaspiceNerdFont ];
  };
}
