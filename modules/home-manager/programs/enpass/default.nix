{ pkgs, ... }:

{
  home.file.enpassAutostart = {
    target = ".config/autostart/" + pkgs.enpass.pname + ".desktop";
    source = (pkgs.enpass + "/share/applications/" + pkgs.enpass.pname + ".desktop");
  };
}
