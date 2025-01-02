{ pkgs, ... }:
  
let 
  vscodeWithExtensions = pkgs.vscode-with-extensions.override {
      vscodeExtensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        jnoortheen.nix-ide
        james-yu.latex-workshop
        ms-python.python
        ms-python.vscode-pylance
        dart-code.dart-code
        dart-code.flutter
      ];
    };
in
{
  environment.systemPackages = with pkgs; [ 
    nixd # Nix language server
    flutter
    vscodeWithExtensions
  ];

  #### Virtualization ####
  users.users.brian.extraGroups = [ "libvirtd" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
  };

  # programs.virt-manager.enable = true;
  virtualisation.vmware.host.enable = true;

}


