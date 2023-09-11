{ config, lib, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default.extensions = with config.nur.repos.rycee.firefox-addons; [
      ublock-origin # An efficient blocker: Fast, potent and lean, and yet can load and enforce thousands more filters than other popular blockers out there
      # TODO: Write script for updating Enpass
      (buildFirefoxXpiAddon {
        pname = "enpass";
        version = "6.8.8";
        addonId = "firefox-enpass@enpass.io";
        url =
          "https://dl.enpass.io/stable/extensions/firefox/versions/v6.8.8-15/enpass-firefox-6.8.8.xpi";
        sha256 =
          "e8722857fe8064acbc2dd78c310f8dfd942d587931de531fe3d69327e8c877fa";
        meta = { };
      }) # Enpass is an OFFLINE password manager
    ];
    # TODO: Write script for updating settings (https://www.privacy-handbuch.de/download/minimal/user.js)
    profiles.default.settings = lib.importJSON ./settings.json;
  };
}