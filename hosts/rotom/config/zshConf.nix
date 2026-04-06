{ config, pkgs, unstable, ... }:
{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
