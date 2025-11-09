{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    # Tools

    # ===============================
    # dotnet
    # ===============================
    dotnetCorePackages.sdk_9_0
    ilspycmd

    # ===============================
    # Java
    # ===============================
    jdk17
    jdk8
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
  ];

  programs.vscode = {
    enable = true;
    # Use FHS variant for better compatibility with extensions and system tools
    package = pkgs.vscode-fhs;
  };


  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  environment.variables = {
    JAVA_17_HOME = "${pkgs.jdk17.home}";
    JAVA_8_HOME  = "${pkgs.jdk8.home}";
    DOTNET_BIN = "${pkgs.dotnetCorePackages.sdk_9_0}/bin/dotnet";
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_9_0}/share/dotnet";
  };

  programs.nix-ld.enable = true;
}
