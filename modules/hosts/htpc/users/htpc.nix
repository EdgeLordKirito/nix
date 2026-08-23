{
  flake.modules.nixos.htpc =
    { pkgs, ... }:
    {
      users.users.htpc = {
        isNormalUser = true;
        hashedPasswordFile = "/persistent/passwd";
        extraGroups = [ "wheel" ];
        packages = with pkgs; [
          tree
        ];
        openssh.authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICqrw6f0csAwW8h61C+e9ZipW6VP2kd7T8H+i3WpDTN0 leite@zekrom"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRM/UERrDicRT0cQ4ym89pACrhB22IM/1g826CcslxB edgelordkirito@rotom"
        ];
      };
    };
}
