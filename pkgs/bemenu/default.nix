
{ stdenv, fetchFromGitHub, cmake, pkgconfig
, pango, wayland, libxkbcommon }:

stdenv.mkDerivation rec {
  name = "bemenu-2019-04-28";

  src = fetchFromGitHub {
    owner = "Cloudef";
    repo = "bemenu";
    rev = "f27e35e";
    sha256 = "09bc623y5yjbz7q83lhl6rb0xs6ji17z79c260bx0fgin8sfj5x8";
  };

  cmakeFlags = [
    "-DBEMENU_CURSES_RENDERER=OFF"
    "-DBEMENU_X11_RENDERER=OFF"
    "-DBEMENU_WAYLAND_RENDERER=ON"
  ];

  nativeBuildInputs = [ cmake pkgconfig ];

  buildInputs = [ pango wayland libxkbcommon ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "A dynamic menu library and client program inspired by dmenu";
    homepage = src.meta.homepage;
    license = with licenses; [ gpl3 lgpl3 ];
    platforms = platforms.linux;
  };
}
