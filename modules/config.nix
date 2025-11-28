{ config, pkgs, lib, unstable, ... }:

let
  # Top-level variable
  trustedusers = ["edgelordkirito"];

  # Import your virtualization aggregator
  virt = import ./virtualisation {
    inherit config pkgs lib unstable;

    dockerConfig = {
      enabled = true;
      users   = trustedusers;
      dns     = ["8.8.8.8" "8.8.4.4"];
    };

    libvirtdConfig = {
      enabled = true;
      users   = trustedusers;
    };

    virtualboxConfig = {
      enabled = false;
      users   = [];
    };
  };
in
{
  config = lib.mkMerge [
    virt
    # add more here
  ];
}


