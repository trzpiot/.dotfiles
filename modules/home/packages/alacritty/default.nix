{ config, lib, ... }:

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
            x = 8;
            y = 8;
          };
          decorations = "none";
        };

        font = {
          size = 11;
          offset.y = 4;
          normal = {
            family = "MonaspiceNe Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "MonaspiceNe Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "MonaspiceNe Nerd Font";
            style = "Italic";
          };
          "bold italic" = {
            family = "MonaspiceNe Nerd Font";
            style = "Bold Italic";
          };
        };
      };
    };
  };
}
