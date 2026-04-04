{ config,
  pkgs,
  lib,
  unstable,
  ...
}:
{
  imports = [
    ./javaSdks.nix
    ./dev.nix
  ];

  programs.javaSdks = {
    enable = true;

    homeJavaPackage = pkgs.jdk17;

    extraJavaPackages = [
      pkgs.jdk8
      pkgs.jdk11
      pkgs.jdk21
    ];

    createEnvVars = true;
    createAliases = true;
  };
}
