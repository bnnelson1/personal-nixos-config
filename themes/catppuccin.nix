{ pkgs, ... }: 

{  
  environment.systemPackages = with pkgs; [
    (catppuccin-kde.override {
      flavour = [ "latte" "macchiato" ];
      accents = [ "rosewater" "blue" ];
    })

    (catppuccin-sddm.override {
      flavor = "macchiato";
      background = "${./backgrounds/shaded_landscape.png}";
      loginBackground = true;
    })
    (catppuccin-sddm.override {
      flavor = "latte";
    })
  ]
  ++ (
    with catppuccin-cursors; [
      latteRosewater
      latteLight
      
      macchiatoRosewater
      macchiatoBlue
      macchiatoDark
    ]
  );

  services.displayManager.sddm = {
    theme = "catppuccin-macchiato";
  };

}

