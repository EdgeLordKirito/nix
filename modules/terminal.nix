{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    yazi
    killall
    # move programming languages to their own module
    go
    stow
    wl-clipboard
    # move programming languages to their own module
    zig
    unzip
    starship
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  #programs.starship = {
  #  enable = true;
  #};
}
