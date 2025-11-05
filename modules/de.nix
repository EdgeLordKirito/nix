{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.krohnkite	
  ];

}
