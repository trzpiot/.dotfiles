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
        inherit (cfg.docker) enable;

        setSocketVariable = true;
      };

      podman = mkIf cfg.podman.enable {
        inherit (cfg.podman) enable;

        dockerCompat = cfg.podman.asDockerReplacement;
        defaultNetwork.settings.dns_enabled = true;

        dockerSocket = {
          inherit (cfg.podman) enable;
        };
      };
    };
  };
}
