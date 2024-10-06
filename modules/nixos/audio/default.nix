{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.audio;
in
{
  options.trzpiot.audio = {
    enable = mkEnableOption "Audio";
  };

  config = mkIf cfg.enable {
    services.pipewire = {
      inherit (cfg) enable;

      pulse = {
        inherit (cfg) enable;
      };

      alsa = {
        inherit (cfg) enable;

        support32Bit = true;
      };
    };

    hardware.pulseaudio.enable = false;
  };
}
