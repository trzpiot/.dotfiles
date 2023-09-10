{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable Wayland support for Electron applications.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Primary monitor is enabled - all other monitors are disabled for the login screen.
  systemd.tmpfiles.rules = let
    monitorsXmlContent = builtins.readFile ./monitors.xml;
    monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent;
  in [ "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}" ];
}
