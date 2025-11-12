{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  environment.variables = {
    XKB_DEFAULT_OPTIONS = "caps:none,compose:caps,terminate:ctrl_alt_bksp";
  };

}
