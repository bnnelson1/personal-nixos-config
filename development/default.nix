{ pkgs, ... }:
  
let 
  vscodeWithExtensions = pkgs.vscode-with-extensions.override {
      vscodeExtensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        jnoortheen.nix-ide
        james-yu.latex-workshop
      ];
    };
in
{
  # Stable version is 2.1.2, 
  #   but 2.3.2 disabled an arguably annoying warning involving 'with'.
  # So, this overlay is to override the stable package and retrieve
  #   the 2.3.2 version instead.
  nixpkgs.overlays = [
    (final: prev: {
      nixd = prev.nixd.overrideAttrs (old: {
        version = "2.3.2";
        src = final.fetchFromGitHub {
          owner = "nix-community";
          repo = "nixd";
          rev = "2.3.2";
          hash = "sha256-ffHLKHpqgVlYLGQ/Dc/6hW/inA98QdMJiv/fT2IrH7c=";
        };
      });
    })
  ];

  environment.systemPackages = with pkgs; [ 
    nixd # Nix language server
    vscodeWithExtensions
  ];

}


