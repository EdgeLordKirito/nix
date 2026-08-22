{ inputs, ... }:
{
  flake.nixosConfigurations.htpc = inputs.nixpkgs-unstable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos; [
      nixpkgsConfig
      htpc
      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
      ../../hosts/htpc/hardware-configuration.nix
    ];
  };
}
