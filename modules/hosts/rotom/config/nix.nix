# modules/hosts/rotom/config/nix.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      nix.optimise.automatic = true;

      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
}
