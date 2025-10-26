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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "rotom";

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

  # Bios update distribution
  services.fwupd.enable = true;

  system.stateVersion = "25.05";
}
