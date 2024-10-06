{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.trzpiot) mkEnumOption mkStrOption;
  inherit (pkgs) tmuxPlugins;

  pluginsWithConfiguration = {
    continuum = {
      plugin = tmuxPlugins.continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
      '';
    };

    dracula = {
      plugin = tmuxPlugins.dracula;
      extraConfig = ''
        set -g @dracula-show-powerline true
        set -g @dracula-plugins "time"
        set -g @dracula-show-empty-plugins false
        set -g @dracula-time-format "%F %R"
        set -g @dracula-show-left-icon ${cfg.icon}
        set -g @dracula-left-icon-padding 0
      '';
    };

    resurrect = {
      plugin = tmuxPlugins.resurrect;
      extraConfig = ''
        set -g @resurrect-capture-pane-contents 'on'
      '';
    };
  };

  cfg = config.trzpiot.packages.tmux;
in
{
  options.trzpiot.packages.tmux = {
    enable = mkEnableOption "tmux";
    icon = mkStrOption null "The left icon.";
    shell = mkEnumOption [
      "bash"
      "fish"
    ] "bash" "The shell for the user.";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      inherit (cfg) enable;

      baseIndex = 1;
      clock24 = true;
      disableConfirmationPrompt = true;
      prefix = "C-space";
      shell = pkgs.${cfg.shell} + "/bin/${cfg.shell}";

      # Normally I would work with `builtins.attrValues` here.
      # However, the order is important, as Dracula must come before resurrect and continuum.
      plugins =
        with tmuxPlugins;
        with pluginsWithConfiguration;
        [
          dracula
          resurrect
          continuum
          yank
        ];

      extraConfig = ''
        set -g default-terminal "tmux-256color"
        set -ag terminal-overrides ",xterm-256color:RGB"
        set -g mouse on
      '';
    };
  };
}
