{ pkgs, ... }:


{
  services = {
    desktopManager.plasma6 = {
      enable = true;
    };
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
  environment.systemPackages = with pkgs; [
  ];
}
