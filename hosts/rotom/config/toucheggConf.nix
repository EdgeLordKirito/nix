{ config, pkgs, unstable, ... }:
{
environment.systemPackages = with pkgs; [
    touchegg
  ];
  services.touchegg.enable = true;
}
