{
  config,
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
      desktopManager.plasma6 = {
        inherit (cfg) enable;
      };

      displayManager.sddm = {
        inherit (cfg) enable;

        wayland = {
          inherit (cfg) enable;
        };
      };
    };

    services.xserver = {
      inherit (cfg) enable;
      inherit videoDrivers;

      xkb = {
        layout = "us";
        variant = "intl";
      };
    };

    fonts.fontconfig = {
      antialias = true;
      subpixel.rgba = "rgb";

      hinting = {
        inherit (cfg) enable;

        style = "full";
      };
    };

    hardware.graphics = {
      inherit (cfg) enable;

      enable32Bit = true;
    };
  };
}
