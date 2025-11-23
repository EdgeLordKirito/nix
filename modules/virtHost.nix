{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "edgelordkirito" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
