{ config, pkgs, lib, ... }:

let
  inherit (builtins) attrValues;
  inherit (config.trzpiot.packages.firefox) enable;
  inherit (config.trzpiot.packages) enpass todoist;
  inherit (lib) mkEnableOption mkIf mkMerge importJSON optionals;
  inherit (pkgs.trzpiot) firefox-gnome-theme;
  inherit (pkgs.nur.repos.rycee) firefox-addons;
  inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;

  # TODO: Write script for updating custom addons
  customAddons = {
    enpass = buildFirefoxXpiAddon rec {
      pname = "enpass";
      version = "6.9.4";
      addonId = "firefox-enpass@enpass.io";
      url = "https://addons.mozilla.org/firefox/downloads/file/4195847/enpass_password_manager-${version}.xpi";
      sha256 = "53008cd7f27be61e9f88185e90c865ed896c1c83cb2cc314c99dbcdf73e54405";
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

  # TODO: Write script for updating settings
  # Source: https://www.privacy-handbuch.de/download/minimal/user.js
  privacySettings = importJSON ./settings.json;
  customSettings = {
    "browser.translations.enable" = false;
    "svg.context-properties.content.enabled" = true;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
in
{
  options.trzpiot.packages.firefox = {
    enable = mkEnableOption "Firefox";
  };

  config = mkIf enable {
    home.file."firefox-gnome-theme" = {
      source = firefox-gnome-theme;
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
    };

    programs.firefox = {
      inherit enable;

      profiles.default = {
        settings = mkMerge [ privacySettings customSettings ];

        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";
          @import "firefox-gnome-theme/userContent.css"; 
        '';

        extensions = attrValues
          {
            inherit (firefox-addons)
              ublacklist
              ublock-origin;
          }
        ++ optionals enpass.enable [ customAddons.enpass ]
        ++ optionals todoist.enable [ customAddons.todoist ];
      };
    };
  };
}
