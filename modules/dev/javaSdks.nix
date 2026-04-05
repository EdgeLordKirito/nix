{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.javaSdks;

  pkgInfoString = pkg:
  let
    pname = pkg.pname or "unknown";
    name = pkg.name or "unknown";
  in
    "(pname: ${pname}, name: ${name})";

  getMajorVersion = pkg:
  let
    version = pkg.version or "unknown";
    pname = pkg.pname or "unknown";
    name = pkg.name or "unknown";

    match = builtins.match "^([0-9]+).*" version;
  in
    if match == null then
      throw "javaSdks: Could not extract major version from ${version} provided by package ${pkgInfoString pkg}"
    else
      builtins.elemAt match 0;

  # Generate ENV vars like JAVA_17_HOME
  mkEnvVars = pkgsList:
    listToAttrs (map (pkg:
      let v = getMajorVersion pkg;
      in {
        name = "JAVA_${v}_HOME";
        value = pkg.home or (throw "javaSdks: Package ${pkgInfoString pkg} has no 'home' attribute");
      }
    ) pkgsList);

  # Generate aliases like java17
  mkAliases = pkgsList:
    listToAttrs (map (pkg:
      let v = getMajorVersion pkg;
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
