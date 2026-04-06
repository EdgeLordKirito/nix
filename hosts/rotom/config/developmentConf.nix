{ config,
  pkgs,
  lib,
  unstable,
  ...
}:
{
  imports = [
    ../../../modules/dev/javaSdks.nix
    ../../../modules/dev/dotnetSdks.nix
    ../../../modules/dev/neovim.nix
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

  edgelordkirito.programs.dotnetSdks = {
    enable = true;

    primaryDotnetPackage = pkgs.dotnetCorePackages.sdk_10_0;

    extraDotnetPackages = [
      pkgs.dotnetCorePackages.sdk_9_0
    ];
  };
}
