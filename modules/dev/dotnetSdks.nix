# modules/dev/dotnetSdks.nix
{
  flake.modules.nixos.dotnetSdks =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.edgelordkirito.programs.dotnetSdks;
      combinedDotnet = pkgs.dotnetCorePackages.combinePackages (
        [ cfg.primaryDotnetPackage ] ++ cfg.extraDotnetPackages
      );
    in
    {
      options.edgelordkirito.programs.dotnetSdks = {
        enable = lib.mkEnableOption "dotnet SDK management";

        primaryDotnetPackage = lib.mkOption {
          type = lib.types.package;
          default = pkgs.dotnetCorePackages.sdk_10_0;
          defaultText = lib.literalExpression "pkgs.dotnetCorePackages.sdk_10_0";
          description = "Primary dotnet SDK. Its host (`dotnet` executable) is the one used in the combined root.";
        };

        extraDotnetPackages = lib.mkOption {
          type = lib.types.listOf lib.types.package;
          default = [ ];
          example = lib.literalExpression ''
            [
              pkgs.dotnetCorePackages.sdk_9_0
              pkgs.dotnetCorePackages.sdk_8_0
            ]
          '';
          description = "Additional dotnet SDKs or runtimes to merge into the primary root.";
        };
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ combinedDotnet ];
        environment.sessionVariables = {
          DOTNET_BIN = "${combinedDotnet}/bin/dotnet";
          DOTNET_ROOT = "${combinedDotnet}/share/dotnet";
          DOTNET_CLI_TELEMETRY_OPTOUT = "1";
        };
      };
    };
}
