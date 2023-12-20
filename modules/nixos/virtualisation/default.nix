{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.virtualisation;
in
{
  options.trzpiot.virtualisation = {
    docker.enable = mkEnableOption "Docker";
    podman = {
      enable = mkEnableOption "Podman";
      asDockerReplacement = mkEnableOption "Use Podman as a Docker drop-in replacement.";
    };
  };

  config = {
    virtualisation = {
      docker.rootless = mkIf cfg.docker.enable {
        enable = true;
        setSocketVariable = true;
      };

      podman = mkIf cfg.podman.enable {
        enable = true;
        dockerCompat = cfg.podman.asDockerReplacement;
        dockerSocket.enable = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
  };
}
