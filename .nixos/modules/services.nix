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
    postgresql = {
      enable = true;
      ensureDatabases = [ "gc" ];
      ensureUsers = [
        {
          name = "gc";
          ensureDBOwnership = true;
        }
      ];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
        # ipv4
        host  all      all     127.0.0.1/32   trust
        # ipv6
        host  all      all     ::1/128        trust
      '';
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      audio.enable = true;
      wireplumber = {
        enable = true;
      };
      # extraConfig.pipewire."10-bluez" = {
      #   "context.properties" = {
      #     "bluez5.roles" = [ "a2dp_sink" "a2dp_source" ];
      #     "bluez5.codecs" = [ "sbc" "aac" "aptx" "ldac" ];
      #     "bluez5.enable-sbc-xq" = true;
      #   };
      # };
    };
    # displayManager.gdm = {
    #   enable = true;
    # };
    greetd.enable = true;
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
