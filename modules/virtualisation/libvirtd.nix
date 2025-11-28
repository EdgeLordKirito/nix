{ config,
  pkgs,
  lib,
  unstable,
  libvirtdConfig ? {},
  ...
}:

let
  # Internal defaults
  defaults = {
    enabled = false;
    users   = [];
  };

  # Merge user config into defaults
  # Example:
  #   defaults        = { enabled = false; users = []; }
  #   libvirtdConfig  = { enabled = true; users = ["myuser"]; }
  #   ----------------------------> merged cfg
  #   cfg             = { enabled = true; users = ["myuser"]; }
  cfg = lib.recursiveUpdate defaults libvirtdConfig;
in
lib.mkIf cfg.enabled {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable  = true;

  # Add users to the libvirtd group
  users.extraGroups.libvirtd.members = cfg.users;
}


