{ lib, osConfig, ... }:

let
  user = lib.trzpiot.findOrNull "username" "sebastian" osConfig.trzpiot.users.users;
in
{

  trzpiot = {
    packages = {
      alacritty.enable = true;
      aseprite.enable = true;
      bat.enable = true;
      bruno.enable = true;
      chromium.enable = true;
      delta.enable = true;
      dircolors.enable = true;
      direnv.enable = true;
      discord.enable = true;
      enpass.enable = true;
      eyedropper.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fd.enable = true;

      firefox = {
        enable = true;
        abovevtt.enable = true;
      };

      fish.enable = true;

      fonts = {
        atkinsonHyperlegible.enable = true;
        hubotSans.enable = true;
        inter.enable = true;
        monaSans.enable = true;
        monaspace.enable = true;
        monaspiceNerdFont.enable = true;
      };

      gimp.enable = true;

      git = {
        enable = true;
        userName = user.name;
        userEmail = user.email;
      };

      godot.enable = true;

      home-manager = {
        enable = true;
        username = user.username;
        name = user.name;
        email = user.email;
      };

      huenicorn.enable = true;
      idea-community.enable = true;
      inkscape.enable = true;
      jq.enable = true;
      lazygit.enable = true;
      libreoffice.enable = true;
      neovim.enable = true;
      nil.enable = true;
      nixfmt.enable = true;
      obsidian.enable = true;
      ollama.enable = true;
      r2modman.enable = true;
      signal-desktop.enable = true;
      spotify.enable = true;
      starship.enable = true;

      steam = {
        enable = true;
        protonGe.enable = true;
      };

      teamspeak.enable = true;
      texlive.enable = true;
      texstudio.enable = true;
      todoist.enable = true;
      vscode.enable = true;
      zoxide.enable = true;
    };
  };
}
