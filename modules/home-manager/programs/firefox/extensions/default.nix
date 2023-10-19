{ config, ... }:

let
  inherit (config.nur.repos.rycee) firefox-addons;
  inherit (config.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;

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
  };
in
{
  programs.firefox.profiles.default.extensions = builtins.attrValues {
    inherit (firefox-addons)
      ublacklist
      ublock-origin;
    inherit (customAddons)
      enpass;
  };
}
