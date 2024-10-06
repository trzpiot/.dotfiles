{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.nix;
in
{
  options.trzpiot.nix = {
    enable = mkEnableOption "Nix";
  };

  config = mkIf cfg.enable {
    services.nix-daemon = {
      inherit (cfg) enable;
    };

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
