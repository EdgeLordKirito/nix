# modules/hosts/rotom/config/development.nix
{
  flake.modules.nixos.rotom =
    { pkgs, unstable, ... }:
    {
      edgelordkirito.programs.javaSdks = {
        enable = true;
        homeJavaPackage = pkgs.jdk17;
        extraJavaPackages = [ pkgs.jdk8 ];
        createEnvVars = true;
        createAliases = true;
      };

      edgelordkirito.programs.dotnetSdks = {
        enable = true;
        primaryDotnetPackage = pkgs.dotnetCorePackages.sdk_10_0;
        extraDotnetPackages = [
          pkgs.dotnetCorePackages.sdk_9_0
          pkgs.dotnetCorePackages.sdk_8_0
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
        # ===============================
        # Editor / Tools
        # ===============================
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
        # Media
        # ===============================
        ffmpeg_6

        # ===============================
        # Nix tooling
        # ===============================
        nixd
        nixfmt
      ];
    };
}
