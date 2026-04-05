{ config, pkgs, lib, ... }:

let
  # local shortcut for host options
  cfg = config.edgelordkirito.virtualisation.docker;

  # defaults for internal use
  defaults = {
    enable       = false;
    enableOnBoot = false;
    users        = [];
    dns          = ["8.8.8.8"];
    dockerOpts   = {}; # optional extra overrides
  };

in
{
  options.edgelordkirito.virtualisation.docker = {
    enable       = lib.mkOption { type = lib.types.bool; default = defaults.enable; description = "Enable Docker"; };
    enableOnBoot = lib.mkOption { type = lib.types.bool; default = defaults.enableOnBoot; description = "Start Docker on boot"; };
    users        = lib.mkOption { type = lib.types.listOf lib.types.str; default = defaults.users; description = "Users to add to docker group"; };
    dns          = lib.mkOption { type = lib.types.listOf lib.types.str; default = defaults.dns; description = "DNS servers for Docker daemon"; };
    dockerOpts   = lib.mkOption { type = lib.types.attrs; default = defaults.dockerOpts; description = "Extra overrides for virtualisation.docker"; };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = lib.mkMerge [
      {
        enable = cfg.enable;
        enableOnBoot = cfg.enableOnBoot;
        daemon.settings.dns = cfg.dns;
      }
      cfg.dockerOpt
    ];
    users.extraGroups.docker.members = cfg.users;
  };
}
