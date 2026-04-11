{ config, lib, pkgs, ... }:

let
  cfg = config.edgelordkirito.programs.neovim;
in
{
  options.edgelordkirito.programs.neovim = {
    enable = lib.mkEnableOption "neovim setup" // { default = false; };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.neovim;
      description = "Neovim package to use";
    };

    dependencies = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "Extra runtime dependencies for plugins/LSP/tools";
    };

    environmentVariables = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Extra environmental variables for plugins/LSP/tools";
    };

    viAlias = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    vimAlias = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    defaultEditor = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages =
      [ cfg.package ] ++ cfg.dependencies;

    environment.shellAliases =
      lib.optionalAttrs cfg.viAlias { vi = "nvim"; }
      // lib.optionalAttrs cfg.vimAlias { vim = "nvim"; };

    environment.variables = (lib.optionalAttrs cfg.defaultEditor { EDITOR = "nvim"; }) // cfg.environmentVariables;
  };
}
