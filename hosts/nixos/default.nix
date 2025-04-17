{ ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/configuration.nix
      ../../modules/users.nix
      ../../modules/locale.nix
      ../../modules/terminal.nix
      ../../modules/shell.nix
      ../../modules/font.nix
    ];

  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub =
    {
      enable = true;
      device = "/dev/sda";
      useOSProber = true; # enable if dual booting
    };

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

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

  system.stateVersion = "24.11";
}
