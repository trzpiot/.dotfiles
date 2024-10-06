{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.homebrew;
in
{
  options.trzpiot.homebrew = {
    enable = mkEnableOption "Homebrew";
  };

  config = mkIf cfg.enable {
    homebrew = {
      inherit (cfg) enable;

      onActivation = {
        autoUpdate = true;
        cleanup = "zap";
        upgrade = true;
      };

      casks = [
        # TODO: Broken in Nixpkgs for aarch64-darwin
        "prusaslicer"

        # TODO: Outdated in Nixpkgs for aarch64-darwin
        "spotify"
      ];
    };
  };
}
