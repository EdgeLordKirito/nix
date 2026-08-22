# modules/hosts/rotom/config/fingerprint.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      services.fprintd.enable = false;
    };
}
