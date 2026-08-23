{
  flake.modules.homeManager.htpc =
    { config, pkgs, ... }:
    let
      # shared custom engine definition, reused across all profiles' hide-lists
      braveEngineDef = {
        urls = [
          {
            template = "https://search.brave.com/search";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "https://cdn.search.brave.com/serp/v2/_app/immutable/assets/brave-search-icon.png";
        definedAliases = [ "@brave" ];
      };

      duckduckgo = {
        name = "DuckDuckGo";
        url = "https://start.duckduckgo.com";
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "google".metaData.hidden = true;
            "bing".metaData.hidden = true;
            "amazondotcom-us".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
          };
        };
      };

      google = {
        name = "Google";
        url = "https://www.google.com";
        search = {
          force = true;
          default = "Google";
          engines = {
            "ddg".metaData.hidden = true;
            "bing".metaData.hidden = true;
            "amazondotcom-us".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
          };
        };
      };

      brave = {
        name = "Brave Search";
        url = "https://search.brave.com";
        search = {
          force = true;
          default = "Brave Search";
          engines = {
            "Brave Search" = braveEngineDef;
            "google".metaData.hidden = true;
            "ddg".metaData.hidden = true;
            "bing".metaData.hidden = true;
            "amazondotcom-us".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
          };
        };
      };
    in
    {
      programs.firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
        profiles = {
          default = {
            id = 0;
            isDefault = true;
            search = duckduckgo.search;
            settings = {
              "browser.startup.homepage" = duckduckgo.url;
              "browser.toolbars.bookmarks.visibility" = "always";
            };
            extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              clearurls
              blocktube
              youtube-nonstop
              return-youtube-dislikes
              bitwarden
              # add more here as needed
            ];
          };
          edgelordkirito = {
            id = 1;
            isDefault = false;
            search = duckduckgo.search;
            settings = {
              "browser.startup.homepage" = duckduckgo.url;
              "browser.toolbars.bookmarks.visibility" = "always";
            };
            extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              clearurls
              blocktube
              youtube-nonstop
              return-youtube-dislikes
              bitwarden
              # add more here as needed
            ];
          };
          mhouney = {
            id = 2;
            isDefault = false;
            search = brave.search;
            settings = {
              "browser.startup.homepage" = brave.url;
              "browser.toolbars.bookmarks.visibility" = "always";
            };
            extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              clearurls
              blocktube
              youtube-nonstop
              return-youtube-dislikes
              bitwarden
              # add more here as needed
            ];
          };

          guest = {
            id = 3;
            isDefault = false;
            search = google.search;
            settings = {
              "browser.startup.homepage" = google.url;
              "browser.toolbars.bookmarks.visibility" = "always";
              "browser.privatebrowsing.autostart" = true;

              "permissions.default.camera" = 2;
              "permissions.default.microphone" = 2;
              "permissions.default.geo" = 2;
              "permissions.default.desktop-notification" = 2;
              "permissions.default.xr" = 2;

              "signon.rememberSignons" = false;
              "signon.autofillForms" = false;
              "extensions.formautofill.addresses.enabled" = false;
              "extensions.formautofill.creditCards.enabled" = false;

              "signon.showAutoCompleteFooter" = false;

              "places.history.enabled" = false;

              "browser.download.manager.retention" = 0;
            };
            extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              clearurls
              blocktube
              youtube-nonstop
              return-youtube-dislikes
              bitwarden
              # add more here as needed
            ];
          };
        };
        policies = {
          DisableAppUpdate = true;
          DisableTelemetry = true;
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableFirefoxAccounts = true;
          DontCheckDefaultBrowser = true;
          NoDefaultBookmarks = true;
          HardwareAcceleration = true;
          PasswordManagerEnabled = false;
          # more below
        };
      };
    };
}
