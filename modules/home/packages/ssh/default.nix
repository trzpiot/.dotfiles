{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.ssh;
in
{
  options.trzpiot.packages.ssh = {
    enable = mkEnableOption "SSH";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      inherit (cfg) enable;

      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";

          extraOptions = {
            addKeysToAgent = "yes";
            UseKeychain = "yes";
            IgnoreUnknown = "UseKeychain";
          };
        };
      };
    };
  };
}
