{ config, pkgs, ... }:
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

    # move programming languages to their own module
    go
    # move programming languages to their own module
    zig
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
