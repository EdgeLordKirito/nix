{ config, pkgs, lib, ... }:

let
  # Shortcut for host options
  cfg = config.edgelordkirito.virtualisation.libvirtd;

  # Internal defaults
  defaults = {
    enable   = false;
    users    = [];
    libvirtdOpts = {}; # optional overrides for the NixOS libvirtd module
  };
in
{
  options.edgelordkirito.virtualisation.libvirtd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = defaults.enable;
      description = "Enable libvirtd virtualization module";
    };

    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = defaults.users;
      description = "Users to add to the libvirtd group";
    };

    libvirtdOpts = lib.mkOption {
      type = lib.types.attrs;
      default = defaults.libvirtdOpts;
      description = "Extra overrides for the virtualisation.libvirtd module";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd = lib.mkMerge [
      {
        enable = cfg.enable;
      }
      cfg.libvirtdOpts
    ];

    programs.virt-manager.enable = cfg.enable;

    # Add users to the libvirtd group
    users.extraGroups.libvirtd.members = cfg.users;
  };
}

