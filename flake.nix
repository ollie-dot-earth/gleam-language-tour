{
  description = "page dev env";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            gleam
            beam28Packages.erlang
            rebar3
            nodejs
            just
            caddy
            watchexec
            firefox
          ];

          shellHook = ''
            echo "page dev env loaded"
            just --list
            echo "Use just to run them."
          '';
        };
      }
    );
}
