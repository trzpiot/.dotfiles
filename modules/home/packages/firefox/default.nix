{ config, pkgs, lib, ... }:

let
  inherit (builtins) attrValues;
  inherit (config.trzpiot.packages) enpass todoist;
  inherit (lib) mkEnableOption mkIf mkMerge importJSON optionals;
  inherit (pkgs.trzpiot) firefox-gnome-theme;
  inherit (pkgs.nur.repos.rycee) firefox-addons;
  inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;

  # TODO: Write script for updating custom addons
  customAddons = {
    enpass = buildFirefoxXpiAddon rec {
      pname = "enpass";
      version = "6.9.4.1";
      addonId = "firefox-enpass@enpass.io";
      url = "https://addons.mozilla.org/firefox/downloads/file/4195847/enpass_password_manager-${version}.xpi";
      sha256 = "sha256-UwCM1/J75h6fiBhekMhl7YlsHIPLLMMUyZ2833PlRAU=";
      meta = { };
    };

    todoist = buildFirefoxXpiAddon rec {
      pname = "todoist";
      version = "11.1";
      addonId = "support@todoist.com";
      url = "https://addons.mozilla.org/firefox/downloads/file/4114398/todoist-${version}.xpi";
      sha256 = "sha256-RrSqcufzCZ/EDSgHi+0JEOgKY1tTLrYgdO0+x3iuDoY=";
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
    "gnomeTheme.hideSingleTab" = true;
    "gnomeTheme.tabsAsHeaderbar" = true;
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
