# modules/hosts/rotom/config/plasma.nix
{
  flake.modules.nixos.rotom =
    {
      pkgs,
      ...
    }:
    {
      environment.variables = {
      };

      services.xserver.enable = true;

      # Enable the KDE Plasma Desktop Environment.
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      environment.plasma6.excludePackages = with pkgs; [
        kdePackages.konsole
        kdePackages.oxygen
        kdePackages.oxygen-icons
        kdePackages.kwallet
        kdePackages.kwallet-pam
        kdePackages.kwalletmanager
      ];
    };
}
