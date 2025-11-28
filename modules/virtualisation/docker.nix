{ config,
  pkgs,
  lib,
  dockerConfig ? {},
  ...
}:

let
  # Internal defaults
  defaults = {
    enabled = false;
    users   = [];
    dns     = ["8.8.8.8"];
  };

  # Merge user config into defaults
  # Example:
  #   defaults       = { enabled = false; users = []; dns = ["8.8.8.8"]; }
  #   dockerConfig   = { enabled = true; users = ["myuser"]; }
  #   ----------------------------> merged cfg
  #   cfg            = { enabled = true; users = ["myuser"]; dns = ["8.8.8.8"]; }
  cfg = lib.recursiveUpdate defaults dockerConfig;
in
lib.mkIf cfg.enabled {
  virtualisation.docker.enable = true;

  virtualisation.docker.daemon.settings = {
    dns = cfg.dns;
  };

  # Add users to the docker group
  users.extraGroups.docker.members = cfg.users;
}
