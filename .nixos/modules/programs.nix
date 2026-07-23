{ config, lib, pkgs, ...}:
let
  unstb = import <nixpkgs> { };
in
{
  programs = {
    regreet.enable = true;
    sway = {
      enable = true;
    };
    fish = {
      enable = true;
      shellAliases = {
        x = "exit";
        c = "clear";
        z = "zellij";
        y = "yazi";
        ze = "zeditor";
      };
      shellAbbrs = {
        gc = "git clone git@github.com:";
        gv = "git clone git@github.com:vg006/";
        fl = "nix flake init -t path:/home/vganesh/.config/.nixos/temp/";
      };
    };
    git = {
      enable = true;
      lfs = {
        enable = true;
        enablePureSSHTransfer = true;
      };
    };
    direnv = {
      enable = true;
      enableFishIntegration = true;
      silent = true;
      nix-direnv.enable = true;
      settings = {
        global = {
          disable_stdin = true;
          hide_env_diff = true;
        };
      };
    };
    thunar = {
      enable = true;
    };
    nix-ld = {
      enable = true;
    };
    ssh = {
      startAgent = true;
      knownHosts = {
        "github.com" = {
          publicKeyFile = /home/vganesh/.ssh/id_ed25519.pub;
        };
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      # Essentials
      gcc
      gnumake
      os-prober
      libnotify
      mako
      sway
      swaybg
      swaylock
      swayidle
      swayimg
      xdg-user-dirs

      # CLI Tools
      btop
      tmux
      unstb.yazi python313Packages.pillow libsixel
      vim neovim helix
      wget curl httpie
      fastfetch
      unstb.gh
      unstb.gitui
      zip unzip p7zip
      mongosh
      zellij
      ripgrep
      unstb.worktrunk

      # Applications
      emacs
      unstb.zed-editor
      vscode
      firefox-bin
      brave
      blueman
      auto-cpufreq
      kitty
      wezterm
      alacritty
      libreoffice-qt6-fresh
      vlc
      vscode
      antigravity
      opencode

      # Others
      nixd
      openssl
      unstb.zathura
      mpv      
    ];
  };
}
