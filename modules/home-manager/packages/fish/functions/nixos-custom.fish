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
