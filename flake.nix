{
  description = "A very basic flake";

  inputs = {
#    nixpkgs.url = "github:nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # for Home Manager
	home-manager = {
	  url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
	};

    # for Hyprland
    #hyprland.url = "github:hyprwm/Hyprland";
	hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # for Hyprland plugins
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # for ags
	ags.url = "github:Aylur/ags";
  };
  
  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
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
          modules = [ ./home.nix ./text.nix ];
        };
      };
    };
}
