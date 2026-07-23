# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
let
  unstb = import <nixpkgs> { };
in
{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/programs.nix
      ./modules/services.nix
    ];

  # Nix configs
  # ===========
  nix = {
    nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
      "nixos-config=/home/vganesh/.config/.nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
    extraOptions = ''
      experimental-features = nix-command flakes
      trusted-users = root vganesh
    '';
  };
  nixpkgs.config.allowUnfree = true;

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/709B-BF90";
    fsType = "vfat";
    options = [ "nosuid" "noexec" "nodev" ];
  };

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        font = /home/vganesh/.local/share/fonts/FiraCodeNerdFontPropo-SemiBold.ttf;
        splashImage = /home/vganesh/gallery/pics/wallpapers/vg/vg_middle_right.png;
      };
      efi.canTouchEfiVariables = true;   
    };
    plymouth = {
      enable = true;
      # theme = "rings";
    };
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [ "quiet" "udev.log_level=3" ];
  };


  networking = {
    hostName = "vixos";
    hosts = {
      "127.0.0.2" = [ "harbor.vixos.local" ];
    };
    networkmanager.enable = true;  
    firewall.enable = true;
  };

  users = {
    users.vganesh = {
      isNormalUser = true;
      description = "Vijay Ganesh";
      shell = pkgs.fish;
      extraGroups = [ "wheel" "docker" "podman" ];
    };
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo.extraRules = [{
      users = ["vganesh"];
      commands = [{
        command = "ALL";
        options = ["NOPASSWD"];
      }];
    }];
    pki.certificateFiles = [
      /data/cert/harbor.vixos.local.crt
    ];
  };

  hardware = {
    nvidia-container-toolkit.enable = true;
    nvidia = {
      open = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      # settings = {
      #   General = {
      #     Experimental = true;
      #   };
      # };
    };
  };
  
  time.timeZone = "Asia/Kolkata";

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system = {
    stateVersion = "24.11"; # Did you read the comment?
    autoUpgrade = {
      enable = true;
    };
    copySystemConfiguration = true;
  };
}

