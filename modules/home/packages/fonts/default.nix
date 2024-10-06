{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption optionals;
  inherit (pkgs) nerdfonts;

  customPkgs = {
    blexMonoNerdFont = nerdfonts.override {
      fonts = [ "IBMPlexMono" ];
    };

    hackNerdFont = nerdfonts.override {
      fonts = [ "Hack" ];
    };

    jetBrainsMonoNerdFont = nerdfonts.override {
      fonts = [ "JetBrainsMono" ];
    };

    monaspiceNerdFont = nerdfonts.override {
      fonts = [ "Monaspace" ];
    };

  };

  cfg = config.trzpiot.packages.fonts;
in
{
  options.trzpiot.packages.fonts = {
    atkinsonHyperlegible.enable = mkEnableOption "Atkinson Hyperlegible";
    blexMonoNerdFont.enable = mkEnableOption "BlexMono Nerd Font (IBM Plex Mono)";
    hackNerdFont.enable = mkEnableOption "Hack Nerd Font (Hack)";
    hubotSans.enable = mkEnableOption "Hubot Sans";
    inter.enable = mkEnableOption "Inter";
    jetBrainsMonoNerdFont.enable = mkEnableOption "JetBrainsMono Nerd Font (JetBrains Mono)";
    monaSans.enable = mkEnableOption "Mona Sans";
    monaspace.enable = mkEnableOption "Monaspace";
    monaspiceNerdFont.enable = mkEnableOption "Monaspice (Monaspace)";
  };

  config = {
    home.packages =
      [ ]
      ++ optionals cfg.atkinsonHyperlegible.enable [ pkgs.atkinson-hyperlegible ]
      ++ optionals cfg.blexMonoNerdFont.enable [ customPkgs.blexMonoNerdFont ]
      ++ optionals cfg.hackNerdFont.enable [ customPkgs.hackNerdFont ]
      ++ optionals cfg.hubotSans.enable [ pkgs.hubot-sans ]
      ++ optionals cfg.inter.enable [ pkgs.inter ]
      ++ optionals cfg.jetBrainsMonoNerdFont.enable [ customPkgs.jetBrainsMonoNerdFont ]
      ++ optionals cfg.monaSans.enable [ pkgs.mona-sans ]
      ++ optionals cfg.monaspace.enable [ pkgs.monaspace ]
      ++ optionals cfg.monaspiceNerdFont.enable [ customPkgs.monaspiceNerdFont ];
  };
}
