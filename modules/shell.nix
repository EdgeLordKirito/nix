{ config, pkgs, ... }:
{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.variables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
  };

  environment.localBinInPath = true;
}
