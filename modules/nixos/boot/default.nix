{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf mkOption;
  inherit (lib.types) listOf str;
  cfg = config.trzpiot.boot;
in
{
  options.trzpiot.boot = {
    enable = mkEnableOption "Booting";

    kernelModules = mkOption {
      type = listOf str;
      default = [ ];
      description = "Kernel modules to be loaded on boot.";
      example = lib.literalExpression ''["amdgpu"]'';
    };
  };

  config = mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
          editor = false;
        };

        efi.canTouchEfiVariables = true;
      };

      initrd = {
        kernelModules = cfg.kernelModules;
      };
    };
  };
}
