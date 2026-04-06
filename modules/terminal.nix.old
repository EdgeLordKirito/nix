{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    # terminal emulator
    kitty
    # terminal programs
    wget
    git
    yazi
    killall
    stow
    wl-clipboard
    unzip
    starship
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
