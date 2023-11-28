{
  description = "A very basic flake";

  inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
	home-manager = {
		#url = github:nix-community/home-manager;
		url = "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };


  outputs = { self, nixpkgs, home-manager, ... }: 
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
		lib = nixpkgs.lib;
	in {
		nixosConfigurations = {
			rob = nixpkgs.lib.nixosSystem {
				inherit system;
				modules = [ ./configuration.nix 
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.rob = {
						imports = [ ./home.nix ];
					};
				}
				
				];
			};
		};
		 
		hmConfig = {
  			pkgs = nixpkgs.legacyPackages.${system};
  			modules = [
    				./home.nix
    
    				{	
      					home = {
        					username = "rob";
        					homeDirectory = "/home/rob";
        					stateVersion = "23.11";
     					 };
    				}		
  			];
		};
		
   };	

  
}
