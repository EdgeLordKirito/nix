# modules/users/edgelordkirito.nix
{
  flake.modules.nixos.edgelordkirito =
    { pkgs, ... }:
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
