{ config, lib, pkgs, ... }:
{
  services = {
    openssh = {
      enable = true;
    };
    mongodb = {
      enable = true;
      package = pkgs.mongodb-ce;
    };
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xserver.videoDrivers = [ "nvidia" ]; 
    blueman.enable = true;
    dbus.packages = [
      pkgs.mako
    ];
    auto-cpufreq.enable = true;
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
  };

  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
    };
    podman = {
      enable = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };

}
