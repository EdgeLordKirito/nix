{ config, pkgs, unstable, ... }:
{
  environment.variables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
  };

  environment.localBinInPath = true;
}
