{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption optionals;
  inherit (pkgs.jetbrains) idea-community idea-ultimate rust-rover;

  cfg = config.trzpiot.packages.jetbrains;
in
{
  options.trzpiot.packages.jetbrains = {
    idea-community.enable = mkEnableOption "IntelliJ IDEA Community Edition";
    idea-ultimate.enable = mkEnableOption "IntelliJ IDEA Ultimate Edition";
    rust-rover.enable = mkEnableOption "RustRover";
  };

  config = {
    home.packages =
      [ ]
      ++ optionals cfg.idea-community.enable [ idea-community ]
      ++ optionals cfg.idea-ultimate.enable [ idea-ultimate ]
      ++ optionals cfg.rust-rover.enable [ rust-rover ];
  };
}
