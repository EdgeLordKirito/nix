{ config, pkgs, lib, unstable ? pkgs, virtualboxConfig ? {}, ... }:

let
  # Defaults
  defaults = {
    enabled = false;
    users   = [];
  };

  # Merge user config with defaults
  # Example:
  #   defaults       = { enabled = false; users = []; }
  #   virtualboxConfig = { enabled = true; users = ["myuser"]; }
  #   -------------------------> merged cfg
  #   cfg            = { enabled = true; users = ["myuser"]; }
  cfg = lib.recursiveUpdate defaults virtualboxConfig;
in
lib.mkIf cfg.enabled {
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableKvm = true;
  virtualisation.virtualbox.host.addNetworkInterface = false;

  # Add users to the vboxusers group
  users.extraGroups.vboxusers.members = cfg.users;
}

