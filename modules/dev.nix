{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    # Use FHS variant for better compatibility with extensions and system tools
    vscode-fhs
  ];
}
