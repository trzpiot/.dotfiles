{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption optionals;
  inherit (pkgs) nerd-fonts;

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
      ++ optionals cfg.blexMonoNerdFont.enable [ nerd-fonts.blex-mono ]
      ++ optionals cfg.hackNerdFont.enable [ nerd-fonts.hack ]
      ++ optionals cfg.hubotSans.enable [ pkgs.hubot-sans ]
      ++ optionals cfg.inter.enable [ pkgs.inter ]
      ++ optionals cfg.jetBrainsMonoNerdFont.enable [ nerd-fonts.jetbrains-mono ]
      ++ optionals cfg.monaSans.enable [ pkgs.mona-sans ]
      ++ optionals cfg.monaspace.enable [ pkgs.monaspace ]
      ++ optionals cfg.monaspiceNerdFont.enable [ nerd-fonts.monaspace ];
  };
}
