{ config,
  pkgs,
  lib,
  unstable,
  ...
}:
let
  trustedUsers = ["edgelordkirito"];
in
{
  imports = [
    ../../../modules/virtualisation/docker.nix
    ../../../modules/virtualisation/libvirtd.nix
    ../../../modules/virtualisation/virtualbox.nix
  ];

  edgelordkirito.virtualisation.virtualbox = {
    enable = false;
    users = [];
  };

  edgelordkirito.virtualisation.docker = {
    enable = true;
    users = trustedUsers;
    dns = ["8.8.8.8" "8.8.4.4"]; 
  };

  edgelordkirito.virtualisation.libvirtd = {
    enable = true;
    users = trustedUsers;
  };
}
