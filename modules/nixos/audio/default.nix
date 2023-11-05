{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.boot;
in
{
  options.trzpiot.audio = {
    enable = mkEnableOption "Audio";
  };

  config = mkIf cfg.enable {
    sound.enable = true;

    services.pipewire = {
      enable = true;
      pulse.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    hardware.pulseaudio.enable = false;
  };
}
