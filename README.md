<div align="center">


<img src="./assets/logo.svg" width=128>

# .dotfiles

[![Maintenance](https://img.shields.io/maintenance/active/2024?style=for-the-badge)](https://github.com/trzpiot/dotfiles/commits/main)
[![Nix Flake](https://img.shields.io/badge/Nix%20Flake-%235277C3?logo=snowflake&style=for-the-badge)](https://nix.dev/concepts/flakes.html)

These are my personal dotfiles. 🔧 Managed with Nix. ❄️

</div>

## Intro

After several years of distro hopping, endless re-installations and re-configurations, I finally decided to stop the distro hopping (to have more time to learn programming languages).
The most obvious solution was a tool that would allow me to configure all my systems & applications universally.
And this tool exists: Nix (and NixOS building on that)

If you haven't heard of [Nix & NixOS](https://nixos.org) yet, but you're interested, I recommend you to browse through [nix.dev](https://nix.dev).

So this repository contains my dotfiles, i.e. all important configurations for all my systems & applications, managed with Nix.

I try to keep my dotfiles always up to date (e.g. with the modern tools [Nix Flakes](https://nix.dev/concepts/flakes.html), [Home Manager](https://github.com/nix-community/home-manager) and [Snowfall Lib](https://github.com/snowfallorg/lib)).
If you have any questions about Nix or NixOS, feel free to create an issue or contact the amazing [community](https://nixos.org/community/).

> [!WARNING]  
> I am constantly changing my dotfiles. Use the code or the flake at your own risk.

## Structure

The structure is given by [Snowfall Lib](https://github.com/snowfallorg/lib) (awesome lib, check it out!).

### homes

This directory contains the configurations for the applications for each user on all my hosts.

Many other Nix users use the concept of "suites" or "archetypes" (enabling multiple applications by setting one option).
I prefer to avoid this, as I like to directly see which applications are being used by all hosts and users.

I also try to install as many applications as possible via the [Home Manager](https://github.com/nix-community/home-manager) in order to keep the systems as lean as possible & to support multi-user systems.

### lib

This directory contains custom Nix functions to simplify usability.

### modules

This directory contains the configurations for [NixOS](./modules/nixos/), [Home Manager](./modules/home/) and [Darwin](./modules/darwin/).

### packages

This directory contains packages that I need but are not in [Nixpkgs](https://github.com/NixOS/nixpkgs) or are outdated there:

- [proton-ge-custom](./packages/proton-ge-custom/) ([Source](https://github.com/GloriousEggroll/proton-ge-custom))

### systems

This directory contains the configurations for my systems.
The hosts are named after the [Greek alphabet](https://en.wikipedia.org/wiki/Greek_alphabet):

- [x86_64-linux/sebastian-alpha](./systems/x86_64-linux/sebastian-alpha/): My main computer running NixOS
- [aarch64-darwin/sebastian-beta](./systems/aarch64-darwin/sebastian-beta/): My MacBook Air M2

## Logo

License: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

[OpenMoji - Snowflake](https://openmoji.org/library/emoji-2744/) (License: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/))