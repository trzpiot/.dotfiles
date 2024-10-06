argparse -n nix-custom h/help -- $argv
or return

function help
    functions -e help
    echo "nix-custom is a wrapper for various Nix commands."
    echo
    echo "usage: nix-custom [-h | --help] <command>"
    echo
    echo "Commands:"
    echo
    echo "   check    Check configuration"
    echo "   clean    Clean up"
    echo "   config   Edit configuration"
    echo "   help     Shows information about nix-custom"
    echo "   switch   Switch to a new configuration"
    echo "   update   Updaste and switch to a new configuration"
end

if set -q _flag_help
    help
    return 0
end

function switchDependingOnSystem
    functions -e switchDependingOnSystem

    if [ @isDarwin@ -eq 1 ]
        darwin-rebuild switch --flake .
    else
        sudo nixos-rebuild --flake .# switch
    end
end

pushd ~/.dotfiles
switch $argv[1]
    case 'check'
        nix flake check
    case 'clean'
        if [ @isDarwin@ -eq 1 ]
            nix-collect-garbage --delete-older-than 7d
        end
        sudo nix-collect-garbage --delete-older-than 7d
    case 'config'
        code .
    case 'help'
        help
    case 'switch'
        switchDependingOnSystem
    case 'update'
        nix flake update
        switchDependingOnSystem
    case '*'
        set_color red
        echo "error: Invalid subcommand"
        set_color normal
    end
popd