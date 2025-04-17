{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    yazi
    killall
    rofi
    go
    stow
    wl-clipboard
    zig
    unzip
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.starship = {
    enable = true;
  };
}
