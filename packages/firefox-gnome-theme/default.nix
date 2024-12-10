{
  stdenv,
  lib,
  fetchzip,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "firefox-gnome-theme";
  version = "133";

  src = fetchzip {
    url = "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/refs/tags/v${finalAttrs.version}.tar.gz";
    sha256 = "sha256-k7v5PE6OcqMkC/u7aokwcxKDmTKM+ejiZGCsH9MK0s0=";
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
