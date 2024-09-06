{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf mkOption;
  inherit (lib.types) listOf str;
  inherit (config.trzpiot.kde) videoDrivers;

  cfg = config.trzpiot.kde;
in
{
  options.trzpiot.kde = {
    enable = mkEnableOption "KDE";

    videoDrivers = mkOption {
      type = listOf str;
      default = [ ];
      description = "Video drivers to be loaded on boot.";
      example = lib.literalExpression ''["amdgpu"]'';
    };
  };

  config = mkIf cfg.enable {
    services = {
      desktopManager.plasma6.enable = true;

      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    services.xserver = {
      inherit videoDrivers;

      enable = true;

      xkb = {
        layout = "us";
        variant = "intl";
      };
    };

    fonts.fontconfig = {
      antialias = true;
      subpixel.rgba = "rgb";

      hinting = {
        enable = true;
        style = "full";
      };
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
