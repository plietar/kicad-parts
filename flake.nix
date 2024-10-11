{
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    perSystem = { pkgs, ... }: {
      packages.interactive-html-bom = pkgs.callPackage ./nix/interactive-html-bom.nix { };
    };

    systems = [
      "x86_64-linux"
      "x86_64-darwin"
    ];
  };
}
