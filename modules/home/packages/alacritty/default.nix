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
          size = 11;
          normal = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Regular";
          };
          bold = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Bold";
          };
          italic = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Italic";
          };
          "bold italic" = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Bold Italic";
          };
        };
      };
    };
  };
}
