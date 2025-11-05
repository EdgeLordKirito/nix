{ config, pkgs, unstable, ... }:
{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.variables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
  };

  environment.localBinInPath = true;
}
