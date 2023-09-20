{
  home.file.gnomeMonitors = {
    source = ./monitors.xml;
    target = ".config/monitors.xml";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      font-name = "Inter 11";
      document-font-name = "Atkinson Hyperlegible 11";
      monospace-font-name = "JetBrainsMono Nerd Font Mono 11";
    };
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "rounded-window-corners@yilozt"
      ];
      favorite-apps =
        [ "firefox.desktop" "org.gnome.Nautilus.desktop" "Alacritty.desktop" ];
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "blank";
    };
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      search-filter-time-type = "last_modified";
    };
    "org/gnome/nautilus/list-view" = { default-zoom-level = "small"; };
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-opacity = 100;
      picture-options = "zoom";
      picture-uri =
        "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      picture-uri-dark =
        "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
      show-desktop-icons = false;
    };
    "org/gnome/shell/extensions/forge/keybindings" = {
      window-focus-down = [ "<Super>Down" ];
      window-focus-left = [ "<Super>Left" ];
      window-focus-right = [ "<Super>Right" ];
      window-focus-up = [ "<Super>Up" ];
      window-move-down = [ "<Shift><Super>Down" ];
      window-move-left = [ "<Shift><Super>Left" ];
      window-move-right = [ "<Shift><Super>Right" ];
      window-move-up = [ "<Shift><Super>Up" ];
      window-swap-down = [ "<Control><Super>Down" ];
      window-swap-left = [ "<Control><Super>Left" ];
      window-swap-right = [ "<Control><Super>Right" ];
      window-swap-up = [ "<Control><Super>Up" ];
    };
  };
}
