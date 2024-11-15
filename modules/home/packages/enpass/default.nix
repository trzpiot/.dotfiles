{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs) enpass;

  cfg = config.trzpiot.packages.enpass;
in
{
  options.trzpiot.packages.enpass = {
    enable = mkEnableOption "Enpass";
  };

  config = mkIf cfg.enable {
    home.file.enpassAutostart = {
      target = ".config/autostart/" + enpass.pname + ".desktop";
      source = (enpass + "/share/applications/" + enpass.pname + ".desktop");
    };

    home.packages = [ enpass ];
  };
}
