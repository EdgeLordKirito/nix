# modules/locale.nix
{
  flake.modules.nixos.locale =
    { config, lib, ... }:
    with lib;
    let
      cfg = config.edgelordkirito.locale;
      mkCategorySettings =
        categories: value:
        listToAttrs (
          map (cat: {
            name = cat;
            inherit value;
          }) categories
        );
    in
    {
      options.edgelordkirito.locale = {
        enable = mkEnableOption "locale and timezone configuration";

        timeZone = mkOption {
          type = types.str;
          default = "UTC";
          description = "System timezone, e.g. Europe/Vienna";
        };

        defaultLocale = mkOption {
          type = types.str;
          default = "en_US.UTF-8";
          description = "Default system locale (LANG and fallback for unset LC_* categories)";
        };

        secondaryLocale = mkOption {
          type = types.nullOr types.str;
          default = null;
          description = ''
            Locale used for the categories listed in `secondaryCategories`
            (e.g. date/currency/measurement formatting), while keeping
            `defaultLocale` for everything else. Set to null to skip this entirely.
          '';
        };

        secondaryCategories = mkOption {
          type = types.listOf types.str;
          default = [
            "LC_ADDRESS"
            "LC_IDENTIFICATION"
            "LC_MEASUREMENT"
            "LC_MONETARY"
            "LC_NAME"
            "LC_NUMERIC"
            "LC_PAPER"
            "LC_TELEPHONE"
            "LC_TIME"
          ];
          description = "Which LC_* categories should use secondaryLocale instead of defaultLocale";
        };

        extraLocaleSettings = mkOption {
          type = types.attrsOf types.str;
          default = { };
          description = "Additional/override LC_* settings, merged on top of secondaryCategories generation";
        };
      };

      config = mkIf cfg.enable {
        time.timeZone = cfg.timeZone;
        i18n.defaultLocale = cfg.defaultLocale;
        i18n.extraLocaleSettings =
          (optionalAttrs (cfg.secondaryLocale != null) (
            mkCategorySettings cfg.secondaryCategories cfg.secondaryLocale
          ))
          // cfg.extraLocaleSettings;
      };
    };
}
