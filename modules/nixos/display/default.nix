{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkIf
    mkMerge
    mkOption
    ;
  inherit (lib.types) listOf str;
  inherit (lib.trzpiot) mkEnumOption;

  cfg = config.trzpiot.display;
in
{
  options.trzpiot.display = {
    enable = mkEnableOption "Display";

    desktopEnvironment = mkEnumOption [
      "gnome"
      "kde"
    ] "gnome" "The desktop environment.";

    videoDrivers = mkOption {
      type = listOf str;
      default = [ ];
      description = "Video drivers to be loaded on boot.";
      example = lib.literalExpression ''["amdgpu"]'';
    };
  };

  config = mkIf cfg.enable {
    services = mkMerge [
      (mkIf (cfg.desktopEnvironment == "gnome") {
        xserver = {
          inherit (cfg) enable videoDrivers;

          displayManager.gdm.enable = true;
          desktopManager.gnome.enable = true;

          xkb = {
            layout = "us";
            variant = "intl";
          };
        };
      })

      (mkIf (cfg.desktopEnvironment == "kde") {
        desktopManager.plasma6 = {
          inherit (cfg) enable;
        };

        displayManager.sddm = {
          inherit (cfg) enable;

          wayland = {
            inherit (cfg) enable;
          };
        };
      })
    ];

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
