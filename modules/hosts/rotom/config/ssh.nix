# modules/hosts/rotom/config/.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      programs.ssh.startAgent = true;
    };
}
