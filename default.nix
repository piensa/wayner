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
    pythonPackages = pkgs.python37Packages;
  }.overrideAttrs (oldAttrs: rec {
    name = "blender-2.80.beta-${version}";
    version = "141c6073ca39";

    src = fetchgit {
      url = "https://git.blender.org/blender.git";
      rev = version;
      sha256 = "0g02y05hr5vim5g6myy16c1dvx6ah8xbjd1j5jw62qd10yfg4kfp";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });

};
in
  waylandPkgs // { inherit waylandPkgs; }

