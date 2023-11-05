{ lib, ... }:

let
  inherit (lib) mkOption;
  inherit (lib.types) enum package str;
in
{
  mkEnumOption = values: default: description:
    mkOption {
      inherit default description;
      type = enum values;
    };

  mkStrOption = default: description:
    mkOption {
      inherit default description;
      type = str;
    };

  mkPackageOption = default: description:
    mkOption {
      inherit default description;
      type = package;
    };
}
