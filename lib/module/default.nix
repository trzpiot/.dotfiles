{ lib, ... }:

let
  inherit (builtins) pathExists;
  inherit (lib) mkOption;
  inherit (lib.lists) findFirst;
  inherit (lib.types) enum int nullOr package str;
in
{
  isNixOS =
    pathExists "/etc/NIXOS";

  findOrNull = parameter: search: list:
    findFirst (x: x.${parameter} == search) null list;

  mkEnumOption = values: default: description:
    mkOption {
      inherit default description;
      type = (nullOr (enum values));
    };

  mkStrOption = default: description:
    mkOption {
      inherit default description;
      type = (nullOr str);
    };

  mkIntOption = default: description:
    mkOption {
      inherit default description;
      type = (nullOr int);
    };

  mkPackageOption = default: description:
    mkOption {
      inherit default description;
      type = package;
    };
}
