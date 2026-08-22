# modules/hosts/rotom/config/locale.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    let
      locale = "de_AT.UTF-8";
    in
    {
      # Set your timezone
      time.timeZone = "Europe/Vienna";
      # Set internationalisation properties
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = locale;
        LC_IDENTIFICATION = locale;
        LC_MEASUREMENT = locale;
        LC_MONETARY = locale;
        LC_NAME = locale;
        LC_NUMERIC = locale;
        LC_PAPER = locale;
        LC_TELEPHONE = locale;
        LC_TIME = locale;
      };
    };
}
