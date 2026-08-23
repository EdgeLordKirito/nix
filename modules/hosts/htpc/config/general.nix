{
  flake.modules.nixos.htpc =
    { pkgs, ... }:
    {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "htpc";
      networking.networkmanager.enable = true;

      edgelordkirito.locale = {
        enable = true;
        timeZone = "Europe/Vienna";
        defaultLocale = "en_US.UTF-8";
        secondaryLocale = "de_AT.UTF-8";
      };

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

      services.openssh = {
        enable = true;

        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
        };
      };

      system.stateVersion = "25.11";
    };
}
