{
  config,
  lib,
  ...
}:

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
      inherit (cfg) enable;

      settings = {
        import = [ "~/.config/alacritty/dracula.toml" ];

        window = {
          decorations = "buttonless";

          padding = {
            x = 8;
            y = 8;
          };
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
