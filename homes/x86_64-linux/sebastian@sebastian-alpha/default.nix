{ lib, osConfig, ... }:

let
  user = lib.trzpiot.findOrNull "username" "sebastian" osConfig.trzpiot.users.users;
in
{

  trzpiot = {
    gnome.enable = true;

    packages = {
      alacritty.enable = true;
      aseprite.enable = true;
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
        atkinsonHyperlegible.enable = true;
        inter.enable = true;
        monaspace.enable = true;
        monaspiceNerdFont.enable = true;
      };

      gimp.enable = true;

      git = {
        enable = true;
        name = user.name;
        email = user.email;
      };

      gnome-boxes.enable = true;

      gnome-extensions = {
        appindicator.enable = true;
        clipboard-history.enable = true;
        paperwm.enable = true;
      };

      gnome-multi-writer.enable = true;
      godot.enable = true;

      home-manager = {
        enable = true;
        username = user.username;
        name = user.name;
        email = user.email;
      };

      idea-community.enable = true;
      jq.enable = true;
      lazygit.enable = true;
      logseq.enable = true;
      neofetch.enable = true;

      neovim = {
        enable = true;

        neorg = {
          workspaces = {
            notes = "~/Workspace/github/trzpiot/private/dev-knowledge-base";
          };
        };
      };

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
}
