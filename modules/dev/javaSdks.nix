{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.javaSdks;

  # Generate ENV vars like JAVA_17_HOME
  mkEnvVars = pkgsList:
    listToAttrs (map (pkg:
      {
        name = "JAVA_${pkg.version}_HOME";
        value = "${pkg.home}";
      }
    ) pkgsList);

  # Generate aliases like java17
  mkAliases = pkgsList:
    listToAttrs (map (pkg:
      {
        name = "java${pkg.version}";
        value = "${pkg}/bin/java";
      }
    ) pkgsList);

in
{
  options.programs.javaSdks = {
    enable = mkEnableOption "Java SDK management";

    homeJavaPackage = mkOption {
      type = types.nullOr types.package;
      default = null;
      description = "Primary Java package used for programs.java";
    };

    extraJavaPackages = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Additional Java SDKs to install";
    };

    createEnvVars = mkOption {
      type = types.bool;
      default = true;
      description = "Create JAVA_<VERSION>_HOME environment variables";
    };

    createAliases = mkOption {
      type = types.bool;
      default = true;
      description = "Create java<VERSION> shell aliases";
    };
  };

  config = mkIf cfg.enable  {

    programs.java = mkIf (cfg.homeJavaPackage != null) {
      enable = true;
      package = cfg.homeJavaPackage;
    };

    environment.systemPackages = cfg.extraJavaPackages;

    environment.variables = mkIf cfg.createEnvVars (
      mkEnvVars cfg.extraJavaPackages
    );

    environment.shellAliases = mkIf cfg.createAliases (
      mkAliases cfg.extraJavaPackages
    );
  };
}
