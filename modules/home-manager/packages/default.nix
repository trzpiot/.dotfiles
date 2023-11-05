{ pkgs, ... }:

let
  customPkgs = {
    jetBrainsMonoNerdfont = pkgs.nerdfonts.override {
      fonts = [ "JetBrainsMono" ];
    };
  };
in
{
  home.packages = builtins.attrValues
    {
      inherit (pkgs)
        aseprite
        atkinson-hyperlegible
        bruno
        delta
        discord
        enpass
        fd
        gimp
        godot_4
        inter
        logseq
        neofetch
        nil
        nixpkgs-fmt
        spotify
        steam
        texstudio;
      inherit (pkgs.gnome)
        dconf-editor
        gnome-boxes;
      inherit (pkgs.gnomeExtensions)
        appindicator
        paperwm;
      inherit (pkgs.jetbrains)
        idea-community;
      inherit (customPkgs)
        jetBrainsMonoNerdfont;
    };
}
