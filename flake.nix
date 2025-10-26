{
  description = "Entry Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixos-hardware.url = "github:Nixos/nixos-hardware";
  };

  outputs = { nixpkgs, nixpkgs-stable, nixos-hardware, ... } @ inputs: {
  	nixosConfigurations = {
	  rotom = let
	    system = "x86_64-linux";

	    pkgs = import nixpkgs {
	      inherit system;
	      config.allowUnfree = true;
	    };

	    pkgsStable = import nixpkgs-stable {
	      inherit system;
	      config.allowUnfree = true;
	    };

	  in nixpkgs.lib.nixosSystem {
	    inherit system;
	    specialArgs = {
	      inherit pkgs pkgsStable;
	    };
	    modules = [
	       ./hosts/rotom
	       ./hosts/rotom/hardware-configuration.nix
	       nixos-hardware.nixosModules.framework-amd-ai-300-series
	    ];
	  }; 
      	};
  };
}
