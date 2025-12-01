{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    projectlibre
    mysql-workbench
  ];
}
