{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf optionals;
  inherit (pkgs.nur.repos.rycee) firefox-addons;
  inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;

  cfg = config.trzpiot.packages.firefox;
  todoistCfg = config.trzpiot.packages.todoist;

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

        extensions =
          builtins.attrValues
            {
              inherit (firefox-addons)
                ublacklist
                ublock-origin;
              inherit (customAddons)
                enpass;
            } ++ optionals todoistCfg.enable [ customAddons.todoist ];
      };
    };
  };
}
