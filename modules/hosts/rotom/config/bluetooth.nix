# modules/hosts/rotom/config/bluetooth.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      # enables support for Bluetooth
      hardware.bluetooth.enable = true;
      # powers up the default Bluetooth controller on boot
      hardware.bluetooth.powerOnBoot = true;
      # allow reading device charge
      hardware.bluetooth.settings = {
        General = {
          Experimental = true;
        };
      };
    };
}
