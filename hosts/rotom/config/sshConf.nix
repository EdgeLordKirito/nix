{ config, pkgs, unstable, ... }:
{
  programs.ssh.startAgent = true;
}
