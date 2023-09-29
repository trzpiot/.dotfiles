# dotfiles

My personal dotfiles. 🔧

## Modules

### home-manager

#### Packages

All packages can be found on [NixOS Search - Packages](https://search.nixos.org/packages) for more information.
Note that I am using the unstable channel by default.

Applications with additional configurations end up in a directory ([programs](modules/home-manager/programs/)) specifically for the application. All others are simply defined in the [default.nix](modules/home-manager/default.nix).

| Package                      | URL                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------ |
| alacritty                    | https://search.nixos.org/packages?channel=unstable&show=alacritty                    |
| aseprite                     | https://search.nixos.org/packages?channel=unstable&show=aseprite                     |
| atkinson-hyperlegible        | https://search.nixos.org/packages?channel=unstable&show=atkinson-hyperlegible        |
| bat                          | https://search.nixos.org/packages?channel=unstable&show=bat                          |
| chromium                     | https://search.nixos.org/packages?channel=unstable&show=chromium                     |
| delta                        | https://search.nixos.org/packages?channel=unstable&show=delta                        |
| dircolors                    | https://search.nixos.org/packages?channel=unstable&show=dircolors                    |
| direnv                       | https://search.nixos.org/packages?channel=unstable&show=direnv                       |
| discord                      | https://search.nixos.org/packages?channel=unstable&show=discord                      |
| enpass                       | https://search.nixos.org/packages?channel=unstable&show=enpass                       |
| eza                          | https://search.nixos.org/packages?channel=unstable&show=eza                          |
| fd                           | https://search.nixos.org/packages?channel=unstable&show=fd                           |
| firefox                      | https://search.nixos.org/packages?channel=unstable&show=firefox                      |
| fish                         | https://search.nixos.org/packages?channel=unstable&show=fish                         |
| fuzzel                       | https://search.nixos.org/packages?channel=unstable&show=fuzzel                       |
| gimp                         | https://search.nixos.org/packages?channel=unstable&show=gimp                         |
| git                          | https://search.nixos.org/packages?channel=unstable&show=git                          |
| gnome.dconf-editor           | https://search.nixos.org/packages?channel=unstable&show=gnome.dconf-editor           |
| gnome.gnome-boxes            | https://search.nixos.org/packages?channel=unstable&show=gnome.gnome-boxes            |
| gnomeExtensions.appindicator | https://search.nixos.org/packages?channel=unstable&show=gnomeExtensions.appindicator |
| gnomeExtensions.paperwm      | https://search.nixos.org/packages?channel=unstable&show=gnomeExtensions.paperwm      |
| godot_4                      | https://search.nixos.org/packages?channel=unstable&show=godot_4                      |
| inter                        | https://search.nixos.org/packages?channel=unstable&show=inter                        |
| jetbrains.idea-community     | https://search.nixos.org/packages?channel=unstable&show=jetbrains.idea-community     |
| jq                           | https://search.nixos.org/packages?channel=unstable&show=jq                           |
| lazygit                      | https://search.nixos.org/packages?channel=unstable&show=lazygit                      |
| less                         | https://search.nixos.org/packages?channel=unstable&show=less                         |
| logseq                       | https://search.nixos.org/packages?channel=unstable&show=logseq                       |
| neofetch                     | https://search.nixos.org/packages?channel=unstable&show=neofetch                     |
| neovim                       | https://search.nixos.org/packages?channel=unstable&show=neovim                       |
| nerdfonts                    | https://search.nixos.org/packages?channel=unstable&show=nerdfonts                    |
| nil                          | https://search.nixos.org/packages?channel=unstable&show=nil                          |
| nixpkgs-fmt                  | https://search.nixos.org/packages?channel=unstable&show=nixpkgs-fmt                  |
| ollama                       | https://search.nixos.org/packages?channel=unstable&show=ollama                       |
| spotify                      | https://search.nixos.org/packages?channel=unstable&show=spotify                      |
| starship                     | https://search.nixos.org/packages?channel=unstable&show=starship                     |
| texlive                      | https://search.nixos.org/packages?channel=unstable&show=texlive                      |
| texstudio                    | https://search.nixos.org/packages?channel=unstable&show=texstudio                    |
| vscode                       | https://search.nixos.org/packages?channel=unstable&show=vscode                       |
| zoxide                       | https://search.nixos.org/packages?channel=unstable&show=zoxide                       |

#### Theme

![](assets/dracula.png)

I always try to use [Dracula](https://draculatheme.com/) as a theme where possible and available.
It's the best theme in my opinion as it's available for hundreds of applications.
And it's just beautiful, so colorful! 🤩
