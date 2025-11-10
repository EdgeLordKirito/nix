{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    unstable.proton-pass
    unstable.protonvpn-gui
  ];
}
