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
		nvf = {
			url = "github:notashelf/nvf";
		};
  };


  
  outputs = { self, nixpkgs, home-manager, nvf, ... } @ inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        eva = lib.nixosSystem {
          inherit system;
          # for Hyprland plugins
          specialArgs = { inherit inputs; };
          modules = [ 
            ./configuration.nix
            ./suspend-and-hibernate.nix
            nvf.nixosModules.default

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
          # for ags
          extraSpecialArgs = { inherit inputs; };
          modules = [
						./home.nix
						./text.nix
					];
        };
      };
    };
}
