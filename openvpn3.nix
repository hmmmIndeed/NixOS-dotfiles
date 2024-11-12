{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		
		nixpkgs-openvpn3 = "github:nixos/nixpkgs/"7590cb109349809b948e8edaeecabdbfe24e4b17";
	};

	outputs = { self, nixpkgs, nixpkgs-openvpn3 flake-utils }:
		flake-utils.lib.eachDefaultSystem
      (system:
			  let
				  pkgs = import nixpkgs { inherit system; };
					pkgs-openvpn3 = import nixpkgs-openvpn3 { inherit system; };
				in
				with pkgs;
				{
					devShell = mkShell {
						buildInputs = [
						  pkgs-openvpn3.openvpn3
						];
					};
				});
};
