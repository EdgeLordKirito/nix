{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    unstable.bitwarden-desktop
    unstable.bitwarden-cli
    obsidian
    element-desktop
  ];
}
