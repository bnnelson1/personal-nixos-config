{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    texliveFull
    libreoffice-qt6-fresh
    obsidian
    zathura
  ];
}

