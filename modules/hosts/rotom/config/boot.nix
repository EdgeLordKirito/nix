# modules/hosts/rotom/config/boot.nix
{
  flake.modules.nixos.rotom =
    {
      config,
      ...
    }:
    {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      #boot.kernelPackages = pkgs.linuxPackages_7_0;
      boot.extraModulePackages = [ config.boot.kernelPackages.wireguard ];
    };
}
