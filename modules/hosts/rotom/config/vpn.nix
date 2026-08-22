# modules/hosts/rotom/config/vpn.nix
{
  flake.modules.nixos.rotom =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        openvpn3
        unstable.proton-vpn
      ];
    };
}
