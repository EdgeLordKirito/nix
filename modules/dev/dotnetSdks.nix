{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.edgelordkirito.programs.dotnetSdks;
in
{
  options.edgelordkirito.programs.dotnetSdks = {
    enable = mkEnableOption "dotnet SDK management";

    primaryDotnetPackage = mkOption {
      type = types.package;
      default = null;
      description = "Primary dotnet package";
    };

    extraDotnetPackages = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Additional dotnet SDKs to install";
    };
  };

  config = mkIf cfg.enable  {
    environment.systemPackages = [cfg.primaryDotnetPackage] ++ cfg.extraDotnetPackages;
    environment.variables = {
      DOTNET_BIN = "${cfg.primaryDotnetPackage}/bin/dotnet";
      DOTNET_ROOT = "${cfg.primaryDotnetPackage}/share/dotnet";
    };
  };
}
