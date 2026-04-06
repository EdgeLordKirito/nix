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
      #../../modules/font.nix
      #../../modules/dev.nix
      ../../modules/de.nix
      ../../modules/vpn.nix
      #../../modules/virtualisationConfig.nix
      ../../modules/art.nix
      ../../modules/dev
      ./config/developmentConf.nix
      ./config/virtualisationConf.nix
      ./config/fontConf.nix
      ./config/bootConf.nix
      ./config/powerConf.nix
      ./config/networkConf.nix
      ./config/bluetoothConf.nix
      ./config/fingerPrintConf.nix
      ./config/sshConf.nix
      ./config/nixConf.nix
      ./config/printerConf.nix
      ./config/audioConf.nix
      ./config/systemPackages.nix
      ./config/toucheggConf.nix
      ./config/firefoxConf.nix
    ];

  # Bootloader

  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  #services.power-profiles-daemon.enable = true;
  #services.tlp.enable = false;

  #networking.hostName = "rotom";

  # Enable networking
  #networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";

  # enables support for Bluetooth
  #hardware.bluetooth.enable = true;
  # powers up the default Bluetooth controller on boot
  #hardware.bluetooth.powerOnBoot = true;
  # allow reading device charge
  #hardware.bluetooth.settings = {
  #  General = {
  #    Experimental = true;
  #  };
  #};

  #services.fprintd.enable = false;
  #programs.ssh.startAgent = true;

  #nix.optimise.automatic = true;

  #nix.gc = {
  #  automatic = true;
  #  dates = "weekly";
  #  options = "--delete-older-than 30d";
  #};


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";
}
