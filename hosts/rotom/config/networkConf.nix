{ config, pkgs, unstable, ... }:
{
  networking.hostName = "rotom";
  # Enable networking
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";
}
