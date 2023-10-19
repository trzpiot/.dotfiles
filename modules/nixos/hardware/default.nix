{
  imports = [ ./hardware-configuration.nix ];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    pulseaudio.enable = false;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      kernelModules = [ "amdgpu" ];
      secrets = { "/crypto_keyfile.bin" = null; };

      luks.devices = {
        "luks-ad2a11dc-789c-4d1c-bba9-7df6ecffebdb" = {
          device = "/dev/disk/by-uuid/ad2a11dc-789c-4d1c-bba9-7df6ecffebdb";
          keyFile = "/crypto_keyfile.bin";
        };
      };
    };
  };
}
