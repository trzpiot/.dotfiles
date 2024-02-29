{ config, lib, pkgs, ... }:

let
  inherit (config.trzpiot.boot) enable kernel kernelModules;
  inherit (lib) mkEnableOption mkIf mkOption;
  inherit (lib.trzpiot) mkEnumOption;
  inherit (lib.types) listOf str;
in
{
  options.trzpiot.boot = {
    enable = mkEnableOption "Booting";
    kernel = mkEnumOption [ "latest" "zen" ] "zen" "The Linux kernel to use.";

    kernelModules = mkOption {
      type = listOf str;
      default = [ ];
      description = "Kernel modules to be loaded on boot.";
      example = lib.literalExpression ''["amdgpu"]'';
    };
  };

  config = mkIf enable {
    boot = {
      kernelPackages = pkgs."linuxPackages_${kernel}";

      loader = {
        systemd-boot = {
          enable = true;
          editor = false;
        };

        efi.canTouchEfiVariables = true;
      };

      initrd = {
        inherit kernelModules;
      };
    };
  };
}
