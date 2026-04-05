{ config,
  pkgs,
  lib,
  unstable,
  ...
}:
{
  imports = [
    ../../../modules/dev/javaSdks.nix
  ];

  programs.javaSdks = {
    enable = true;

    homeJavaPackage = pkgs.jdk17;

    extraJavaPackages = [
      pkgs.jdk8
    ];

    createEnvVars = true;
    createAliases = true;
  };
}
