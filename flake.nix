{
  description = "Entry Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { nixpkgs, nixpkgs-stable, ... } @ inputs: {
  	nixosConfigurations = {
	  nixos = let
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
	       ./hosts/nixos
	    ];
	  };

      #  Desktop = let
      #	    system = "x86_64-linux";
      #
      #    pkgs = import nixpkgs {
      #      inherit system;
      #      config.allowUnfree = true;
      #    };
      #
      #    pkgs-stable = import nixpkgs-stable {
      #      inherit system;
      #      config.allowUnfree = true;
      #    };
      #
      #  in nixpkgs.lib.nixosSystem {
      #    inherit system;
      #    specialArgs = {
      #      inherit pkgs pkgs-stable;
      #    };
      #    modules = [
      #      ./hosts/Desktop
      #    ];
      #  };
      	  
      	};
  };
}
