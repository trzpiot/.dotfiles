{
  imports = [ ./hardware-configuration.nix ];

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.pulseaudio.enable = false;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  boot.initrd.luks.devices."luks-ad2a11dc-789c-4d1c-bba9-7df6ecffebdb".device =
    "/dev/disk/by-uuid/ad2a11dc-789c-4d1c-bba9-7df6ecffebdb";
  boot.initrd.luks.devices."luks-ad2a11dc-789c-4d1c-bba9-7df6ecffebdb".keyFile =
    "/crypto_keyfile.bin";

}
