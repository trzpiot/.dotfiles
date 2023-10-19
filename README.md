# dotfiles

My personal dotfiles. 🔧

## Introduction

These are the dotfiles for my PC with NixOS. 
I try to keep them always up to date (e.g. with the modern tools Nix Flakes and Home Manager).
If you have any questions about Nix or NixOS, feel free to create an issue or contact the amazing [community](https://nixos.org/community/).

## Setup

> [!WARNING]  
> The dotfiles are very tailored to my PC & needs.
> Don't take them without further thoughts but pick out the parts you need. 
> If you still have questions, feel free to create an issue.

<details>
  <summary>Setup guide</summary>
  
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

  Customize the dotfiles according to your needs.

  Update the Nix Flake.

  ```sh
  nix flake update --experimental-features 'nix-command flakes'
  ```

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
> The dotfiles are tailored to a single system (NixOS).
> This may change in the future.

### nixos

[nixos](modules/nixos/) contains configurations that are close to the system.
This means for example configurations for the hardware, Nix, security, etc.

### home-manager

[home-manager](modules/home-manager/) contains configurations for user applications like Firefox, Git, etc.
In this module (as the name suggests) [Home Manager](https://github.com/nix-community/home-manager) is used.

## Packages

Programs that can be configured with Home Manager are located in their own directories under [programs](./modules/home-manager/programs/).
All other packages are defined in [packages](./modules/home-manager/packages/default.nix).

More details to each package can be found on [NixOS Search - Packages](https://search.nixos.org/packages).
Note that I am using the unstable channel by default.

## Theme

![](assets/dracula.png)

I always try to use [Dracula](https://draculatheme.com/) as a theme where possible and available.
It's the best theme in my opinion as it's available for hundreds of applications.
And it's just beautiful, so colorful! 🤩

## Development

For development I use [devenv](https://devenv.sh/) with Nix Flakes.
