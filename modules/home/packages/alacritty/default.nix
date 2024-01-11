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
      source = ./dracula.toml;
      target = ".config/alacritty/dracula.toml";
    };

    programs.alacritty = {
      enable = true;
      settings = {
        import = [ "~/.config/alacritty/dracula.toml" ];

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
          bold_italic = {
            family = "MonaspiceNe Nerd Font";
            style = "Bold Italic";
          };
        };
      };
    };
  };
}
