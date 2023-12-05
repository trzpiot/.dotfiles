{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.alacritty;
in
{
  options.trzpiot.packages.alacritty = {
    enable = mkEnableOption "alacritty";
  };

  config = mkIf cfg.enable {
    home.file.alacrittyDracula = {
      source = ./dracula.yml;
      target = ".config/alacritty/dracula.yml";
    };

    programs.alacritty = {
      enable = true;
      settings = {
        import = [ "~/.config/alacritty/dracula.yml" ];

        window = {
          padding = {
            x = 4;
            y = 4;
          };
          decorations = "none";
        };

        font = {
          size = 10;
          offset.y = 2;
          normal = {
            family = "Hack Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "Hack Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "Hack Nerd Font";
            style = "Italic";
          };
          "bold italic" = {
            family = "Hack Nerd Font";
            style = "Bold Italic";
          };
        };
      };
    };
  };
}
