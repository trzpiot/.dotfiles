{ stdenv, lib, fetchzip }:

stdenv.mkDerivation (finalAttrs: {
  pname = "proton-ge-custom";
  version = "8-32";

  src = fetchzip {
    url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton${finalAttrs.version}/GE-Proton${finalAttrs.version}.tar.gz";
    sha256 = "sha256-ZBOF1N434pBQ+dJmzfJO9RdxRndxorxbJBZEIifp0w4=";
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
