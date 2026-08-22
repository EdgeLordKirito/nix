# modules/hosts/rotom/config/touch.nix
{
  flake.modules.nixos.rotom =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        touchegg
      ];
      services.touchegg.enable = true;
    };
}
