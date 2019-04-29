self: pkgs:
let
waylandPkgs = rec {
  # temp
  sway-beta = sway;

  # wlroots-related
  scdoc            = pkgs.callPackage ./pkgs/scdoc {};
  wlroots          = pkgs.callPackage ./pkgs/wlroots {};
  xdg-desktop-portal-wlr = pkgs.callPackage ./pkgs/xdg-desktop-portal-wlr {};
  sway             = pkgs.callPackage ./pkgs/sway {};
  dmenu-wayland    = pkgs.callPackage ./pkgs/dmenu {};
  swc              = pkgs.callPackage ./pkgs/swc {};
  wld              = pkgs.callPackage ./pkgs/wld {};
  bemenu           = pkgs.callPackage ./pkgs/bemenu {};
  swayidle         = pkgs.callPackage ./pkgs/swayidle {};
  swaylock         = pkgs.callPackage ./pkgs/swaylock {};
  grim             = pkgs.callPackage ./pkgs/grim {};
  slurp            = pkgs.callPackage ./pkgs/slurp {};
  mako             = pkgs.callPackage ./pkgs/mako {};
  kanshi           = pkgs.callPackage ./pkgs/kanshi {};
  wlstream         = pkgs.callPackage ./pkgs/wlstream {};
  oguri            = pkgs.callPackage ./pkgs/oguri {};
  waybar           = pkgs.callPackage ./pkgs/waybar {};
  wf-config        = pkgs.callPackage ./pkgs/wf-config {};
  wayfire          = pkgs.callPackage ./pkgs/wayfire { wlroots = pkgs.wlroots; };
  redshift-wayland = pkgs.callPackage ./pkgs/redshift-wayland {
    inherit (pkgs.python3Packages) python pygobject3 pyxdg wrapPython;
    geoclue = pkgs.geoclue2;
  };
  bspwc            = pkgs.callPackage ./pkgs/bspwc {};
  waybox           = pkgs.callPackage ./pkgs/waybox {};
  wl-clipboard     = pkgs.callPackage ./pkgs/wl-clipboard {};
  wf-recorder      = pkgs.callPackage ./pkgs/wf-recorder {};

  gebaar-libinput  = pkgs.callPackage ./pkgs/gebaar-libinput {};

  # i3-related
  i3status-rust    = pkgs.callPackage ./pkgs/i3status-rust {};

  keepass-with-plugins = pkgs.keepass.override {
    plugins = [ pkgs.keepass-keepassrpc
                pkgs.keepass-keeagent
                pkgs.keepass-keepasshttp
              ];
  };

  blender-beta = pkgs.blender.override {
    name = "blender-2.80.beta-2019-04-28";
    pythonPackages = pkgs.python37Packages;
    src = pkgs.fetchgit {
      url = "https://git.blender.org/blender.git";
      rev = "141c6073ca39";
      sha256 = "0g02y05hr5vim5g6myy16c1dvx6ah8xbjd1j5jw62qd10yfg4kfp";
    };

    cmakeFlags = [
      "-DPYTHON_NUMPY_PATH=${pkgs.numpy}/${pkgs.python.sitePackages}"
"-DWITH_MOD_OCEANSIM=ON"
      "-DWITH_CODEC_FFMPEG=ON"
      "-DWITH_CODEC_SNDFILE=ON"
      "-DWITH_INSTALL_PORTABLE=OFF"
      "-DWITH_FFTW3=ON"
      #"-DWITH_SDL=ON"
      "-DWITH_GAMEENGINE=ON"
      "-DWITH_OPENCOLORIO=ON"
      "-DWITH_SYSTEM_OPENJPEG=ON"
      "-DWITH_PLAYER=ON"
      "-DWITH_OPENSUBDIV=ON"
      "-DPYTHON_LIBRARY=${pkgs.python.libPrefix}m"
      "-DPYTHON_LIBPATH=${pkgs.python}/lib"
      "-DPYTHON_INCLUDE_DIR=${pkgs.python}/include/${pkgs.python.libPrefix}m"
      "-DPYTHON_VERSION=${pkgs.python.pythonVersion}"
      "-DWITH_PYTHON_INSTALL=OFF"
      "-DWITH_PYTHON_INSTALL_NUMPY=OFF"
    ];
  };
};
in
  waylandPkgs // { inherit waylandPkgs; }

