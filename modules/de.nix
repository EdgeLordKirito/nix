{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.krohnkite	
  ];

}
