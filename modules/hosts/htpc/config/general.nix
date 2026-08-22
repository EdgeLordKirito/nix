{
  flake.modules.nixos.htpc =
    { pkgs, ... }:
    {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "nixos"; # note: doesn't match the "htpc" attribute name — intentional?
      networking.networkmanager.enable = true;

      edgelordkirito.locale = {
        enable = true;
        timeZone = "Europe/Vienna";
        defaultLocale = "en_US.UTF-8";
        secondaryLocale = "de_AT.UTF-8";
      };

      services.xserver.enable = true;
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;
      services.xserver.xkb = {
        layout = "de,us";
        options = "grp:alt_shift_toggle";
      };

      environment.systemPackages = with pkgs; [
        vim
        neovim
        git
        stow
        kitty
        firefox
      ];

      services.openssh.enable = true;

      system.stateVersion = "25.11";
    };
}
