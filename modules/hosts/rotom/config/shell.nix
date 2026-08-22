# modules/hosts/rotom/config/shell.nix
{
  flake.modules.nixos.rotom =
    {
      pkgs,
      ...
    }:
    {
      environment.variables = {
        EDITOR = "nvim";
        TERMINAL = "kitty";
      };

      environment.localBinInPath = true;

      programs.zsh.enable = true;
      users.defaultUserShell = pkgs.zsh;
    };
}
