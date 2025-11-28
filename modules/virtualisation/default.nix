{ config,
  pkgs,
  lib,
  unstable,
  dockerConfig ? {},
  libvirtdConfig ? {},
  virtualboxConfig ? {},
  ...
}:

# Aggregator for virtualization modules (Docker + libvirtd)
# Forward user-provided sets to each submodule.
# Only specify the fields you want to override; defaults are handled internally.
lib.mkMerge [
  # Docker module
  (import ./docker.nix {
    inherit config pkgs lib unstable;
    inherit dockerConfig;
  })

  # libvirtd module
  (import ./libvirtd.nix {
    inherit config pkgs lib unstable;
    inherit libvirtdConfig;
  })

  (import ./virtualbox.nix {
    inherit config pkgs lib unstable;
    inherit virtualboxConfig;
  })
]
