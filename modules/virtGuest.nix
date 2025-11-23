{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.seamless= true;
  virtualisation.virtualbox.guest.clipboard =true;
}
