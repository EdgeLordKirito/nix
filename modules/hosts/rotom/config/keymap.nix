# modules/hosts/rotom/config/keymap.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
    };
}
