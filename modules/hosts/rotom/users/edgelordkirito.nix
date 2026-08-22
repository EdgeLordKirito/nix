# modules/hosts/rotom/config/edgelordkirito.nix
{
  flake.modules.nixos.rotom =
    {
      pkgs,
      ...
    }:
    {
      users.users.edgelordkirito = {
        isNormalUser = true;
        description = "EdgeLordKirito";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
        packages = with pkgs; [
        ];
      };
    };
}
