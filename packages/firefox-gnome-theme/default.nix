{ stdenv, lib, fetchzip }:

stdenv.mkDerivation (finalAttrs: {
  pname = "firefox-gnome-theme";
  version = "124";

  src = fetchzip {
    url = "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/refs/tags/v${finalAttrs.version}.tar.gz";
    sha256 = "sha256-NOfsWKOLifmRLIySbjlJFFLuRT8UVyLeZItuLCjvIno=";
  };

  preInstall = ''
    mkdir $out
  '';

  installPhase = ''
    runHook preInstall

    mv * $out/

    runHook postInstall
  '';

  meta =
    let
      inherit (lib.platforms) linux;
      inherit (lib.licenses) unlicense;
    in
    {
      description = "A GNOME theme for Firefox";
      homepage = "https://github.com/rafaelmardojai/firefox-gnome-theme";
      license = [ unlicense ];
      platforms = linux;
      maintainers = [ ];
    };
})
