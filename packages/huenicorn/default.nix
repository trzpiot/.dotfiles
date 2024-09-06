{
  trzpiot,
  stdenv,
  lib,
  fetchFromGitLab,
  cmake,
  pkg-config,
  curl,
  opencv,
  asio,
  nlohmann_json,
  mbedtls,
  glm,
  pipewire,
  glib,
  pcre2,
  libsepol,
  libselinux,
  xorg,
  clang,
  util-linuxMinimal,
  makeWrapper,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "huenicorn";
  version = "1.0.8";

  src = fetchFromGitLab {
    owner = "openjowelsofts";
    repo = "huenicorn";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-ElLbiFP4QJF+ysbOZfdSC8V/MT4x/WrNKEJZyYwKvY8=";
  };

  nativeBuildInputs = [
    makeWrapper
    cmake
    pkg-config
    # Currently we need to use Clang instead of GCC because of a bug with PipeWire.
    # See: https://gitlab.com/openjowelsofts/huenicorn/-/issues/13
    clang
  ];

  buildInputs = [
    curl
    opencv
    asio
    nlohmann_json
    mbedtls
    glm
    pipewire
    glib
    pcre2
    libsepol
    libselinux
    xorg.libX11
    xorg.libXext
    xorg.libXrandr
    util-linuxMinimal
    trzpiot.crow
  ];

  env.NIX_CFLAGS_COMPILE = "-Wno-error";

  cmakeFlags = [
    "-Wmismatched-tags"
    "-DCMAKE_BUILD_TYPE=MinSizeRel"
    "-DCMAKE_C_COMPILER=clang"
    "-DCMAKE_CXX_COMPILER=clang++"
  ];

  preInstall = ''
    mkdir -p $out/share/huenicorn
    mkdir -p $out/bin
  '';

  installPhase = ''
    runHook preInstall

    mv webroot $out/share/huenicorn
    mv huenicorn $out/bin

    wrapProgram $out/bin/huenicorn --chdir $out/share/huenicorn

    runHook postInstall
  '';

  meta =
    let
      inherit (lib.platforms)
        linux
        ;
      inherit (lib.licenses)
        gpl3Only
        ;
    in
    {
      description = "Huenicorn is a free Philips Hue™ bias lighting driver for Gnu/Linux";
      homepage = "https://huenicorn.org";
      license = [ gpl3Only ];
      platforms = linux;
      maintainers = [ ];
    };
})
