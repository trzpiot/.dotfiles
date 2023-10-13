# dotfiles

My personal dotfiles. 🔧

## Introduction

These are the dotfiles for my PC with NixOS. 
I try to keep them always up to date (e.g. with the modern tools Nix Flakes and Home Manager).

If you have any questions about Nix or NixOS, feel free to create an issue or contact the amazing [community](https://nixos.org/community/).

## Installation

> [!WARNING]  
> The dotfiles are very tailored to my PC & needs.
> Don't take them without further thoughts but pick out the parts you need. 
> If you still have questions, feel free to create an issue.

<details>
  <summary>Installation guide</summary>
  
  Install NixOS according to the [official documentation](https://nixos.org/manual/nixos/stable/#ch-installation).

  Boot into the installed system.

  Log in with the user you added.

  Install the `git` package.

  Then clone the dotfiles.

  ```sh
  git clone git@github.com:trzpiot/dotfiles.git ~/.dotfiles
  ```

  Move the file `/etc/nixos/hardware-configuration.nix` to `~/.dotfiles/modules/nixos/hardware/hardware-configuration.nix`.

  Remove the directory `/etc/nixos`.
  It's no longer needed because we configure the system using the dotfiles.

  Switch to the dotfiles directory.

  ```sh
  cd ~/.dotfiles
  ```

  Update the Nix Flake.

  ```sh
  nix flake update --experimental-features 'nix-command flakes'
  ```

  Edit the dotfiles 
  Rebuild the system using the dotfiles.

  ```sh
  sudo nixos-rebuild --flake .# switch --experimental-features 'nix-command flakes'
  ```

  Reboot.

  Have fun!
</details>

## Modules

Currently, the dotfiles are divided into two modules.
This is (for now) only for the sake of clarity.

> [!NOTE]  
> Currently, the dotfiles are tailored to a single system (NixOS).
> This may change in the future.

### nixos

[nixos](modules/nixos/) contains configurations that are close to the system.
This means for example configurations for the hardware, Nix, security, etc.

### home-manager

[home-manager](modules/home-manager/) contains configurations for user applications like Firefox, Git, etc.
In this module (as the name suggests) [Home Manager](https://github.com/nix-community/home-manager) is used.

## Packages

All packages can be found on [NixOS Search - Packages](https://search.nixos.org/packages) for more information.
Note that I am using the unstable channel by default.

<details>
  <summary>List of installed packages</summary>
  
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
  | logseq                       | https://search.nixos.org/packages?channel=unstable&show=logseq                       |
  | neofetch                     | https://search.nixos.org/packages?channel=unstable&show=neofetch                     |
  | neovim                       | https://search.nixos.org/packages?channel=unstable&show=neovim                       |
  | nerdfonts                    | https://search.nixos.org/packages?channel=unstable&show=nerdfonts                    |
  | nil                          | https://search.nixos.org/packages?channel=unstable&show=nil                          |
  | nixpkgs-fmt                  | https://search.nixos.org/packages?channel=unstable&show=nixpkgs-fmt                  |
  | spotify                      | https://search.nixos.org/packages?channel=unstable&show=spotify                      |
  | starship                     | https://search.nixos.org/packages?channel=unstable&show=starship                     |
  | texlive                      | https://search.nixos.org/packages?channel=unstable&show=texlive                      |
  | texstudio                    | https://search.nixos.org/packages?channel=unstable&show=texstudio                    |
  | vscode                       | https://search.nixos.org/packages?channel=unstable&show=vscode                       |
  | zoxide                       | https://search.nixos.org/packages?channel=unstable&show=zoxide                       |
</details>

## Theme

![](assets/dracula.png)

I always try to use [Dracula](https://draculatheme.com/) as a theme where possible and available.
It's the best theme in my opinion as it's available for hundreds of applications.
And it's just beautiful, so colorful! 🤩

## Development

For development I use [devenv](https://devenv.sh/) with Nix Flakes.
