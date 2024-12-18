{
  imports = [ ./hardware-configuration.nix ];

  trzpiot = {
    audio.enable = true;

    boot = {
      enable = true;
      kernelModules = [ "amdgpu" ];
    };

    display = {
      enable = true;
      desktopEnvironment = "kde";
    };

    gaming.enable = true;

    home-manager.enable = true;
    locale.enable = true;
    network.enable = true;
    nix.enable = true;
    security.enable = true;
    ssh.enable = true;

    users = {
      enable = true;

      users = [
        {
          username = "sebastian";
          name = "Sebastian Gabriel Trzpiot";
          email = "dev@trzpiot.de";
          shell = "fish";
        }
      ];
    };

    virtualisation = {
      podman = {
        enable = true;
        asDockerReplacement = true;
      };
    };
  };

  boot.initrd = {
    secrets = {
      "/crypto_keyfile.bin" = null;
    };

    luks.devices = {
      "luks-ad2a11dc-789c-4d1c-bba9-7df6ecffebdb" = {
        device = "/dev/disk/by-uuid/ad2a11dc-789c-4d1c-bba9-7df6ecffebdb";
        keyFile = "/crypto_keyfile.bin";
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05";
}
