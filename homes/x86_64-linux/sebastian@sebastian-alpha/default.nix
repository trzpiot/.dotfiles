{ lib, pkgs, config, osConfig ? { }, format ? "unknown", ... }:

{
  trzpiot = {
    gnome.enable = true;
    packages = {
      alacritty.enable = true;
      aseprite.enable = true;
      atkinson-hyperlegible.enable = true;
      bat.enable = true;
      bruno.enable = true;
      chromium.enable = true;
      dconf-editor.enable = true;
      delta.enable = true;
      dircolors.enable = true;
      direnv.enable = true;
      discord.enable = true;
      enpass.enable = true;
      eyedropper.enable = true;
      eza.enable = true;
      fd.enable = true;
      firefox.enable = true;
      fish.enable = true;
      fonts = {
        blexMonoNerdFont.enable = true;
        hackNerdFont.enable = true;
      };
      gimp.enable = true;
      git.enable = true;
      gnome-boxes.enable = true;
      gnome-extensions.appindicator.enable = true;
      gnome-extensions.paperwm.enable = true;
      godot.enable = true;
      home-manager.enable = true;
      idea-community.enable = true;
      jq.enable = true;
      lazygit.enable = true;
      logseq.enable = true;
      neofetch.enable = true;
      neovim.enable = true;
      nil.enable = true;
      nixpkgs-fmt.enable = true;
      spotify.enable = true;
      starship.enable = true;
      steam.enable = true;
      texlive.enable = true;
      texstudio.enable = true;
      todoist.enable = true;
      vscode.enable = true;
      zoxide.enable = true;
    };
  };

  home = {
    stateVersion = "23.05";
    username = "sebastian";
    homeDirectory = "/home/sebastian";
  };
}
