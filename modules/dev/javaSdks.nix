{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.javaSdks;

  # Extract version from jdk-style package names (e.g. jdk17, jdk17_headless)
  getVersion = pkg:
    let
      name = pkg.pname or (lib.getName pkg);
      match = builtins.match "jdk([0-9]+).*" name;
    in
      if match != null then builtins.elemAt match 0
      else throw "Package ${name} is not a supported jdk package (expected format: jdk<version>)";

  # Generate ENV vars like JAVA_17_HOME
  mkEnvVars = pkgsList:
    listToAttrs (map (pkg:
      let v = getVersion pkg;
      in {
        name = "JAVA_${v}_HOME";
        value = "${pkg}";
      }
    ) pkgsList);

  # Generate aliases like java17
  mkAliases = pkgsList:
    listToAttrs (map (pkg:
      let v = getVersion pkg;
      in {
        name = "java${v}";
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
