{ nixos-hardware , pkgs, unstable, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ../../modules/configuration.nix
      ../../modules/users.nix
      ../../modules/locale.nix
      ../../modules/terminal.nix
      ../../modules/shell.nix
      ../../modules/font.nix
      ../../modules/dev.nix
    ];

  # Bootloader

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "rotom";

  # Enable networking
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";

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

  services.fprintd.enable = false;

  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };


  system.stateVersion = "25.05";
}
