{ lib, ... }:

let
  inherit (lib) mkOption;
  inherit (lib.lists) findFirst;
  inherit (lib.types) enum nullOr package str;
in
{
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

  mkPackageOption = default: description:
    mkOption {
      inherit default description;
      type = package;
    };
}
