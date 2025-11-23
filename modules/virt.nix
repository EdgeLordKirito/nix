{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    virtualbox  # GUI + core binaries
    #virtualboxExtpack
  ];

  # Enable VirtualBox host support
  virtualisation.virtualbox.host.enable = true;

  # Optional: Add your user to the vboxusers group
  users.users.edgelordkirito.extraGroups = [ "vboxusers" ];
}
