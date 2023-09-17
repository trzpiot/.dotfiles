{
  programs.fish = {
    enable = true;
    shellInit = ''
      complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'check' -d 'Check NixOS configuration'
      complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'config' -d 'Edit NixOS configuration'
      complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'switch' -d 'Switch to a new NixOS configuration'
      complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'update' -d 'Update NixOS and switch to a new configuration'
    '';
    interactiveShellInit = "neofetch";
    shellAliases = {
      cat = "bat";
      cd = "z";
      find = "fd";
      lg = "lazygit";
    };
    functions = {
      nixos-custom = {
        body = ''
          pushd ~/.dotfiles
          switch $argv[1]
            case 'check'
                nix flake check
            case 'config'
                code .
            case 'switch'
                sudo nixos-rebuild --flake .# switch
            case 'update'
                nix flake update
                sudo nixos-rebuild --flake .# switch
            case '*'
                set_color red
                echo "error: Invalid subcommand"
                set_color normal
          end
          popd
        '';
        description = "Custom commands for NixOS";
      };
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      devenv = {
        body = ''
          nix flake init --template github:cachix/devenv
          echo .devenv >> .gitignore
          echo .direnv >> .gitignore
        '';
      };
    };
  };
}
