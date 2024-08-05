{
  description = "chiichen's NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.chiichen = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        # ./gui/hyprland.nix
        ./gui/kde.nix
        ./gui/fonts.nix
        ./driver/nvidia.nix
        ./driver/opengl.nix
        ./system/gc.nix
        ./system/dynamic-link.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.chiichen = import ./home.nix;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = inputs;
        }
      ];
    };
  };
}
