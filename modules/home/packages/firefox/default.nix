{ config, pkgs, lib, ... }:

let
  inherit (builtins) attrValues;
  inherit (config.trzpiot.packages.firefox) enable abovevtt;
  inherit (config.trzpiot.packages) enpass todoist;
  inherit (lib) mkEnableOption mkIf optionals;
  inherit (pkgs.nur.repos.rycee) firefox-addons;
  inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;

  # TODO: Write script for updating custom addons
  customAddons = {
    abovevtt = buildFirefoxXpiAddon rec {
      pname = "abovevtt";
      version = "1.12";
      addonId = "{52e126d4-d2d7-483a-a0a1-6e8aace23253}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4268944/abovevtt-${version}.xpi";
      sha256 = "sha256-8qzAuCYXPjX7HUi5yOjfytoq5Sj3wSiCpMuvrIGcf80=";
      meta = { };
    };

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
in
{
  options.trzpiot.packages.firefox = {
    enable = mkEnableOption "Firefox";
    abovevtt.enable = mkEnableOption "AboveVTT";
  };

  config = mkIf enable {


    programs.firefox = {
      inherit enable;

      profiles.default = {
        settings = {
          "browser.translations.enable" = false;
        };

        extensions = attrValues
          {
            inherit (firefox-addons)
              ublacklist
              ublock-origin;
          }
        ++ optionals abovevtt.enable [ customAddons.abovevtt ]
        ++ optionals enpass.enable [ customAddons.enpass ]
        ++ optionals todoist.enable [ customAddons.todoist ];
      };
    };
  };
}
