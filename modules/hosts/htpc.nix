{ inputs, ... }:
{
  flake.nixosConfigurations.htpc = inputs.nixpkgs-unstable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos; [
      nixpkgsConfig
      htpc
      locale
      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.htpc = {
          imports = with inputs.self.modules.homeManager; [ htpc ];
        };
      }
      ../../hosts/htpc/hardware-configuration.nix
    ];
  };
}
