# modules/hosts/htpc/config/plasma.nix
{
  flake.modules.nixos.htpc =
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

      environment.plasma6.excludePackages = with pkgs.kdePackages; [
        konsole
        oxygen
        oxygen-icons
        kwallet
        kwallet-pam
        kwalletmanager
      ];

      environment.systemPackages = with pkgs.kdePackages; [
        plasma-browser-integration
      ];
    };
}
