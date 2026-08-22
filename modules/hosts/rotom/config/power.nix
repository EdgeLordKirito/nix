# modules/hosts/rotom/config/power.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      services.power-profiles-daemon.enable = true;
      services.tlp.enable = false;
    };
}
