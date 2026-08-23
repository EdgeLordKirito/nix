{ inputs, ... }:
let
  system = "x86_64-linux";

  nixpkgsConfig = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-39.8.10"
    ];
  };
  overlays = [ inputs.nur.overlays.default ];
  unstable = import inputs.nixpkgs-unstable {
    inherit system overlays;
    config = nixpkgsConfig;
  };
in
{
  flake.modules.nixos.nixpkgsConfig = {
    nixpkgs = {
      inherit system overlays;
      config = nixpkgsConfig;
    };
  };

  # stash these so host-assembly files (modules/hosts/*.nix) can read them
  flake.lib = {
    inherit system nixpkgsConfig unstable;
  };
}
