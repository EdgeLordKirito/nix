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
      };
    };
}
