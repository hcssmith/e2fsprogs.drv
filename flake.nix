{
  description = "A very basic flake";

  inputs = {
    flake-lib = {
      url = "github:hcssmith/flake-lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    flake-lib,
  }:
    flake-lib.lib.mkApp {
      inherit self;
      name = "e2fsprogs";
      drv = pkgs:
        pkgs.e2fsprogs.overrideAttrs (_: {
          doCheck = false;
        });
    };
}
