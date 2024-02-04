{ stdenv, lib, fetchzip }:

stdenv.mkDerivation (finalAttrs: {
  pname = "proton-ge-custom";
  version = "8-30";

  src = fetchzip {
    url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton${finalAttrs.version}/GE-Proton${finalAttrs.version}.tar.gz";
    sha256 = "sha256-ACgvZgMtFkth8s07u0vwC/khnA7D6hGiS+Zd3tbv0os=";
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
      inherit (lib.licenses) bsd3;
    in
    {
      description = "Compatibility tool for Steam Play based on Wine and additional components";
      homepage = "https://github.com/GloriousEggroll/proton-ge-custom";
      license = [ "Custom" bsd3 ];
      platforms = linux;
      maintainers = [ ];
    };
})
