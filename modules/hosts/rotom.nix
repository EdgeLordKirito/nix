# modules/hosts/rotom.nix
{ inputs, ... }:
{
  flake.nixosConfigurations.rotom = inputs.nixpkgs.lib.nixosSystem {
    inherit (inputs.self.lib) system;

    specialArgs = {
      inherit (inputs.self.lib) unstable;
    };

    modules = with inputs.self.modules.nixos; [
      nixpkgsConfig
      rotom

      locale

      javaSdks
      dotnetSdks
      neovim
      docker
      libvirtd
      virtualbox

      ../../hosts/rotom/hardware-configuration.nix
      inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
    ];
  };
}
