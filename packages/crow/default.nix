{
  stdenv,
  lib,
  fetchFromGitHub,
  cmake,
  asio,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "crow";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "CrowCpp";
    repo = "Crow";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-fokj+KiS6frPVOoOvETxW3ue95kCcYhdhOlN3efzBd4=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    asio
  ];

  meta =
    let
      inherit (lib.platforms) linux;
      inherit (lib.licenses) bsd3;
    in
    {
      description = "A Fast and Easy to use microframework for the web";
      homepage = "https://crowcpp.org";
      license = [ bsd3 ];
      platforms = linux;
      maintainers = [ ];
    };
})
