{
  imports = [ ./dconf ];

  home.file.gnomeMonitors = {
    source = ./monitors.xml;
    target = ".config/monitors.xml";
  };
}
