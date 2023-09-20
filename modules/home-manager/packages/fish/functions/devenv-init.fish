nix flake init --template github:cachix/devenv
echo .devenv >>.gitignore
echo .direnv >>.gitignore
