{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (builtins) attrValues;
  inherit (lib) mkEnableOption mkIf optionals;
  inherit (pkgs.nur.repos.rycee) firefox-addons;
  inherit (firefox-addons) buildFirefoxXpiAddon;

  # TODO: Write script for updating custom addons
  customAddons = {
    abovevtt = buildFirefoxXpiAddon rec {
      pname = "abovevtt";
      version = "1.25";
      addonId = "{52e126d4-d2d7-483a-a0a1-6e8aace23253}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4268944/abovevtt-${version}.xpi";
      sha256 = "sha256-8qzAuCYXPjX7HUi5yOjfytoq5Sj3wSiCpMuvrIGcf80";
      meta = { };
    };

    enpass = buildFirefoxXpiAddon rec {
      pname = "enpass";
      version = "6.11.0.3";
      addonId = "firefox-enpass@enpass.io";
      url = "https://addons.mozilla.org/firefox/downloads/file/4195847/enpass_password_manager-${version}.xpi";
      sha256 = "sha256-UwCM1/J75h6fiBhekMhl7YlsHIPLLMMUyZ2833PlRAU";
      meta = { };
    };

    todoist = buildFirefoxXpiAddon rec {
      pname = "todoist";
      version = "11.2";
      addonId = "support@todoist.com";
      url = "https://addons.mozilla.org/firefox/downloads/file/4114398/todoist-${version}.xpi";
      sha256 = "sha256-RrSqcufzCZ/EDSgHi+0JEOgKY1tTLrYgdO0+x3iuDoY=";
      meta = { };
    };
  };

  enpassCfg = config.trzpiot.packages.enpass;
  todoistCfg = config.trzpiot.packages.todoist;

  cfg = config.trzpiot.packages.firefox;
in
{
  options.trzpiot.packages.firefox = {
    enable = mkEnableOption "Firefox";
    abovevtt.enable = mkEnableOption "AboveVTT";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      inherit (cfg) enable;

      profiles.default = {
        settings = {
          "browser.translations.enable" = false;
        };

        extensions =
          attrValues { inherit (firefox-addons) ublacklist ublock-origin; }
          ++ optionals cfg.abovevtt.enable [ customAddons.abovevtt ]
          ++ optionals enpassCfg.enable [ customAddons.enpass ]
          ++ optionals todoistCfg.enable [ customAddons.todoist ];
      };
    };
  };
}
