{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf mkOption;
  inherit (lib.trzpiot) mkEnumOption;
  inherit (lib.types) listOf str;

  cfg = config.trzpiot.boot;
in
{
  options.trzpiot.boot = {
    enable = mkEnableOption "Booting";
    kernel = mkEnumOption [
      "latest"
      "zen"
    ] "zen" "The Linux kernel to use.";

    kernelModules = mkOption {
      type = listOf str;
      default = [ ];
      description = "Kernel modules to be loaded on boot.";
      example = lib.literalExpression ''["amdgpu"]'';
    };
  };

  config = mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs."linuxPackages_${cfg.kernel}";

      loader = {
        systemd-boot = {
          inherit (cfg) enable;

          editor = false;
        };

        efi.canTouchEfiVariables = true;
      };

      initrd = {
        inherit (cfg) kernelModules;
      };
    };
  };
}
