{
  networking = {
    hostName = "nixos";
    dhcpcd.enable = false;

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}
