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

  edgelordkirito.programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    package = unstable.neovim;
  };

  programs.nix-ld.enable = true;

  networking.firewall.allowedTCPPorts = [ 9003 ];


  environment.systemPackages = with pkgs; [
    # Tools
    # Use FHS variant for better compatibility with extensions and system tools
    unstable.vscode-fhs

    # ===============================
    # dotnet
    # ===============================
    ilspycmd

    # ===============================
    # Java
    # ===============================
    gradle

    # ===============================
    # Go
    # ===============================
    go
    unstable.gopls
    unstable.delve
    golangci-lint

    # ===============================
    # Zig
    # ===============================
    zig

    # ===============================
    # JS
    # ===============================
    nodejs_24

    # ===============================
    # SQL
    # ===============================
    unstable.jetbrains.datagrip

    # ===============================
    #
    # ===============================

    ffmpeg_6
  ];
}
