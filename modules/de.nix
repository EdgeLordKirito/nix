{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  environment.variables = {
    XKB_DEFAULT_OPTIONS = "compose:ralt,terminate:ctrl_alt_bksp";
  };

}
