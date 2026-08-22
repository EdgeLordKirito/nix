# modules/hosts/rotom/config/virtualisation.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    let
      trustedUsers = [ "edgelordkirito" ];
    in
    {
      edgelordkirito.virtualisation.virtualbox = {
        enable = false;
        users = [ ];
      };
      edgelordkirito.virtualisation.docker = {
        enable = true;
        users = trustedUsers;
        dns = [
          "8.8.8.8"
          "8.8.4.4"
        ];
      };
      edgelordkirito.virtualisation.libvirtd = {
        enable = true;
        users = trustedUsers;
      };
    };
}
