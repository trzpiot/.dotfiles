{ lib, ... }:

{
  imports = [ ./extensions ];

  programs.firefox = {
    enable = true;

    # TODO: Write script for updating settings
    # Source: https://www.privacy-handbuch.de/download/minimal/user.js
    profiles.default.settings = lib.importJSON ./settings.json;
  };
}
