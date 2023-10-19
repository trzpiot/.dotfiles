{ pkgs, ... }:

let
  inherit (pkgs) enpass;
in
{
  home.file.enpassAutostart = {
    target = ".config/autostart/" + enpass.pname + ".desktop";
    source = (enpass + "/share/applications/" + enpass.pname + ".desktop");
  };
}
