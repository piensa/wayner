# From https://github.com/NixOS/nixpkgs/blob/92a047a6c4d46a222e9c323ea85882d0a7a13af8/pkgs/applications/window-managers/velox/wld.nix
{ lib, stdenv, fetchFromGitHub, pkgconfig
, wayland, fontconfig, pixman, freetype, libdrm
}:

stdenv.mkDerivation rec {
  name = "wld-${version}";
  version = "git-2017-10-31";

  src = fetchFromGitHub {
    owner = "michaelforney";
    repo = "wld";
    rev = "b4e902bbecb678c45485b52c3aa183cbc932c595";
    sha256 = "0j2n776flnzyw3vhxl0r8h1c48wrihi4g6bs2z8j4hbw5pnwq1k6";
  };

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [ wayland fontconfig pixman freetype libdrm ];

  makeFlags = "PREFIX=$(out)";
  installPhase = "PREFIX=$out make install";

  enableParallelBuilding = true;

  meta = {
    description = "A primitive drawing library targeted at Wayland";
    homepage    = src.meta.homepage;
    license     = lib.licenses.mit;
    platforms   = lib.platforms.linux;
    maintainers = with lib.maintainers; [ ];
  };
}
