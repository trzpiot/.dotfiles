{ pkgs, ... }:

{
  users.users.sebastian = {
    isNormalUser = true;
    description = "Sebastian Gabriel Trzpiot";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}
