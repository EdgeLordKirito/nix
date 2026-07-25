{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    bitwarden-desktop
    bitwarden-cli
    obsidian
    element-desktop
    krita
    kitty
    wget
    git
    yazi
    killall
    stow
    wl-clipboard
    unzip
    starship
    dig
    kdePackages.filelight
    ansible
  ];
}
