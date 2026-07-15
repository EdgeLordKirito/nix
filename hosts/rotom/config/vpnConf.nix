{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    openvpn3
    unstable.proton-vpn
  ];
}
