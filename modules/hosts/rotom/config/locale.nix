# modules/hosts/rotom/config/locale.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      edgelordkirito.locale = {
        enable = true;
        timeZone = "Europe/Vienna";
        defaultLocale = "en_US.UTF-8";
        secondaryLocale = "de_AT.UTF-8";
      };
    };
}
