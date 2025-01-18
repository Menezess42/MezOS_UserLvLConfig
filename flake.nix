{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		stylix.url = "github:danth/stylix";
		nixCats.url = "./nixCats/"; # Flake local
		mezVim.url = "./mezVim/";
	};

	outputs = { nixpkgs, home-manager, stylix, nixCats, mezVim,  ... }@inputs: {
		homeConfigurations."menezess42" = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.x86_64-linux;
			modules = [
				stylix.homeManagerModules.stylix
					nixCats.homeModule
					mezVim.homeModule
					./home.nix
			];
		};
	};
}
