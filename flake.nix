{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # for Home Manager
  	home-manager = {
  	  url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
  	};

		hyprutils = {
			url = "github:hyprwm/hyprutils";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		aquamarine = {
			type = "git";
			url = "https://github.com/hyprwm/aquamarine";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    # for Hyprland
		hyprland = {
			type = "git";
			submodules = true;
    	url = "https://github.com/hyprwm/Hyprland";
      
			inputs.hyprutils.follows = "hyprutils";
			inputs.aquamarine.follows = "aquamarine";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    #hyprland.url = "github:hyprwm/hyprland";
    #hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # for Hyprland plugins
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";
    #};


    # for ags
	  ags.url = "github:Aylur/ags";
    # for schizofox
		schizofox.url = "github:schizofox/schizofox";
    # for nvf
		nvf.url = "github:notashelf/nvf";

    # for the other .nix files
    #imports = [ ./nixes ];
    #nixFiles = import ./nixes/default.nix;
  };


  
  outputs = { self, nixpkgs, home-manager, nvf, ... } @ inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        eva = lib.nixosSystem {
          #inherit system;
          # for Hyprland plugins
          specialArgs = { inherit inputs system; };
          modules = [ 
            ./configuration.nix
            ./nixes/suspend-and-hibernate.nix
            ./nixes/greetd.nix
            inputs.nvf.nixosModules.default

#    		home-manager.nixosModules.home-manager
#			{
#			  home-manager = {
#			    extraSpecialArgs = {
#				  inherit inputs;
#				};
#                useGlobalPkgs = true;
#                useUserPackages = true;
#                backupFileExtension = "backup";
#                users.asulk = [ ./home.nix ./text.nix ];
#             };
#           }
          ];
        };
      };
      homeConfigurations = {
        asulk = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs system; };
          modules = [
						./home.nix
						./nixes/text.nix
            #./nixes/schizofox.nix
            #./kanshi.nix
					];
        };
      };
    };
}
