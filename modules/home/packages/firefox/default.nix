{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs.nur.repos.rycee) firefox-addons;
  inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;

  cfg = config.trzpiot.packages.firefox;

  # TODO: Write script for updating custom addons
  customAddons = {
    enpass = buildFirefoxXpiAddon rec {
      pname = "enpass";
      version = "6.8.8";
      addonId = "firefox-enpass@enpass.io";
      url = "https://dl.enpass.io/stable/extensions/firefox/versions/v${version}-15/enpass-firefox-${version}.xpi";
      sha256 = "e8722857fe8064acbc2dd78c310f8dfd942d587931de531fe3d69327e8c877fa";
      meta = { };
    };
    todoist = buildFirefoxXpiAddon rec {
      pname = "todoist";
      version = "11.1";
      addonId = "support@todoist.com";
      url = "https://addons.mozilla.org/firefox/downloads/file/4114398/todoist-${version}.xpi";
      sha256 = "46b4aa72e7f3099fc40d28078bed0910e80a635b532eb62074ed3ec778ae0e86";
      meta = { };
    };
  };
in
{
  options.trzpiot.packages.firefox = {
    enable = mkEnableOption "Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      # TODO: Write script for updating settings
      # Source: https://www.privacy-handbuch.de/download/minimal/user.js
      profiles.default = {
        settings = lib.importJSON ./settings.json;

        extensions = builtins.attrValues {
          inherit (firefox-addons)
            ublacklist
            ublock-origin;
          inherit (customAddons)
            enpass
            todoist;
        };
      };
    };
  };
}
