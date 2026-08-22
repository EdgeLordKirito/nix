# modules/hosts/rotom/config/firefox.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      programs.firefox.enable = true;
    };
}
