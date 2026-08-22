# modules/hosts/rotom/config/printer.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      # Enable CUPS to print documents.
      services.printing.enable = true;
    };
}
