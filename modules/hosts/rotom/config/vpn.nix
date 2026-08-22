# modules/hosts/rotom/config/vpn.nix
{
  flake.modules.nixos.rotom =
    {
      pkgs,
      unstable,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        openvpn3
        unstable.proton-vpn
      ];
    };
}
