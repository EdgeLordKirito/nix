{ config, pkgs, lib, ... }:

let
  # Shortcut to host config
  cfg = config.edgelordkirito.virtualisation.virtualbox;

  # Internal defaults
  defaults = {
    enable        = false;
    users         = [];
    enableKvm     = true;
    addNetworkInterface = false;
    virtualboxOpts = {};     # optional overrides for the NixOS virtualbox module
  };
in
{
  options.edgelordkirito.virtualisation.virtualbox = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = defaults.enable;
      description = "Enable VirtualBox host module";
    };

    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = defaults.users;
      description = "Users to add to the vboxusers group";
    };

    enableKvm = lib.mkOption {
      type = lib.types.bool;
      default = defaults.enableKvm;
      description = "Enable KVM support in VirtualBox host";
    };

    addNetworkInterface = lib.mkOption {
      type = lib.types.bool;
      default = defaults.addNetworkInterface;
      description = "Whether to add a network interface in VirtualBox host";
    };

    virtualboxOpts = lib.mkOption {
      type = lib.types.attrs;
      default = defaults.virtualboxOpts;
      description = "Extra overrides for the virtualisation.virtualbox module";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.virtualbox = lib.mkMerge [
      {
        host.enable = true;
	host.enableKvm = cfg.enableKvm;
	host.addNetworkInterface = cfg.addNetworkInterface;
      }
      cfg.virtualboxOpts
    ];
    # Add users to vboxusers
    users.extraGroups.vboxusers.members = cfg.users;
  };
}
