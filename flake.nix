{
  description = "Entry Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:Nixos/nixos-hardware";
  };

  outputs = { nixpkgs, nixpkgs-unstable, nixos-hardware, ... } @ inputs: {
  	nixosConfigurations = {
	  rotom = let
	    system = "x86_64-linux";

	    #pkgs = import nixpkgs {
	    #  inherit system;
	    #  config.allowUnfree = true;
	    #};
	    nixpkgsConfig = {
    	      allowUnfree = true;
            };

	    unstable = import nixpkgs-unstable {
	      inherit system;
	      config = nixpkgsConfig;
	    };

	  in nixpkgs.lib.nixosSystem {
	    inherit system;
	    # https://www.reddit.com/r/NixOS/comments/1hwovqu/you_have_set_specialargspkgs_which_means_that/ 
	    specialArgs = {
	      inherit unstable;
	    };
	    modules = [
	       { nixpkgs = {  inherit system; config = nixpkgsConfig; }; }
	       ./hosts/rotom
	       ./hosts/rotom/hardware-configuration.nix
	       nixos-hardware.nixosModules.framework-amd-ai-300-series
	    ];
	  }; 
      	};
  };
}
