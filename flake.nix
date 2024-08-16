{
  description = "System configuration with Flake dependency management for NixOS";

  inputs = {
    # Package and flake sources
    # Primary stable NixOS release channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager flake
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    # System configuration entrypoint
    # Rebuilds with `# nixos-rebuild --flake .[#hostname]`
    nixosConfigurations = {
      # Primary desktop system
      kobold-desktop = nixpkgs.lib.nixosSystem {
        # Load system configuration modules for this host
        modules = [
          ./hosts/kobold-desktop/configuration.nix
        ];
      };
    };

    # Home configuration entrypoint (using home-manager)
    # Rebuilds with `$ home-manager --flake .[#username@hostname]`
    homeConfigurations = {
      # Primary user
      qynn = home-manager.lib.homeManagerConfiguration {
        # Inherit package sources
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        # Load home configuration modules for this user/host
        modules = [
          ./home/qynn/home.nix
        ];
      };
    };
  };
}
