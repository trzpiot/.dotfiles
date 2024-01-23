{ lib, osConfig, ... }:

let
  user = lib.trzpiot.findOrNull "username" "strzpiot" osConfig.trzpiot.users.users;
in
{
  trzpiot.packages = {
    alacritty.enable = true;
    bat.enable = true;
    bruno.enable = true;
    delta.enable = true;
    dircolors.enable = true;
    direnv.enable = true;
    eza.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    fish.enable = true;

    fonts = {
      hubotSans.enable = true;
      monaSans.enable = true;
      monaspace.enable = true;
      monaspiceNerdFont.enable = true;
    };

    home-manager = {
      enable = true;
      username = user.username;
      name = user.name;
      email = user.email;
    };

    idea-community.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    neovim.enable = true;
    nil.enable = true;
    nixpkgs-fmt.enable = true;
    obsidian.enable = true;
    ollama.enable = true;
    podman.enable = true;
    starship.enable = true;
    vscode.enable = true;
    zoxide.enable = true;
  };
}
