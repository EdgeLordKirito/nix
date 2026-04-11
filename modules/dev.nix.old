{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    # Tools
    # Use FHS variant for better compatibility with extensions and system tools
    unstable.vscode-fhs

    # ===============================
    # dotnet
    # ===============================
#    dotnetCorePackages.sdk_10_0
    ilspycmd

    # ===============================
    # Java
    # ===============================
#    jdk17
#    jdk8
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


#  environment.variables = {
#    DOTNET_BIN = "${pkgs.dotnetCorePackages.sdk_10_0}/bin/dotnet";
#    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_10_0}/share/dotnet";
#  };

  programs.nix-ld.enable = true;

  networking.firewall.allowedTCPPorts = [ 9003 ];
}
