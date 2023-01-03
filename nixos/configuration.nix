# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
 
let 
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};

in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
      nur.repos.kira-bruneau.modules.lightdm-webkit2-greeter
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "pl_PL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  #Audio
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink";	
  nixpkgs.config.pulseaudio = true;

  # Docker
  virtualisation.docker.enable = true;

  # Configure keymap in X11
 
  services.xserver = {
    layout = "pl";
    xkbVariant = "";

    enable = true;

    libinput.enable = true;
    displayManager = {
        lightdm = {
	  enable = true;
	  greeters.webkit2 = {
		enable = true;
		webkitTheme =  fetchTarball {
            		url = "https://github.com/Litarvan/lightdm-webkit-theme-litarvan/releases/download/v3.2.0/lightdm-webkit-theme-litarvan-3.2.0-nixos.tar.gz";
            		sha256 = "10j7vg11mhs0mhl9r4j01zfq8naszkdhanxf84b02m1irz063wsd";
          		};
	  };
      	};
	defaultSession = "none+awesome";
    };

    windowManager.awesome = {
	enable = true;
	luaModules = with pkgs.luaPackages; [
	  luarocks
	  luadbi-mysql
	];
    };
  };
  # Configure console keymap
  console.keyMap = "pl2";
	
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.michalczyz = {
    isNormalUser = true;
    description = "Michał Czyż";
    extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
    packages = with pkgs; [];
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
     neovim-unwrapped
     firefox
     zsh
     git
     wezterm
     python311
     luajit
     gcc
     tree-sitter
     nodejs
     jetbrains.idea-ultimate
     temurin-bin
     kotlin
     kotlin-language-server
     java-language-server
     ktlint
     sumneko-lua-language-server
     gradle
     rofi
     jq
     discord
     arandr
     pavucontrol
     brightnessctl
     insomnia
     docker
     docker-compose
     zk
     lazygit
     zip
     unzip
     lua
     luajit
     luajitPackages.luarocks
     cmake
     fzf
     ripgrep
     yarn
     emanote
     brave
     zathura
     ranger
     spotify
  ];


  fonts.fonts = with pkgs; [
    #fira-code
    #fira-code-symbols
    #cascadia-code
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
    meslo-lgs-nf
  ];

  home-manager.users.michalczyz = { pkgs, ... }: {
  home.stateVersion = "22.11";
  home.homeDirectory = "/home/michalczyz";
  programs.zsh = {
    enable = true;
    shellAliases = {
    	n = "nvim";
	nrs = "sudo nixos-rebuild switch";
	nconf = "cd /etc/nixos/ && sudo nvim configuration.nix";
	dot = "cd /home/michalczyz/Documents/dotfiles && nvim";
	rg = "ranger";
	nt = "cd ~/Documents/Notes/test && nvim";
    	};	
    zplug = {
	enable = true;
	plugins = [
		{name = "zsh-users/zsh-syntax-highlighting"; tags = [defer:2];}
		{name = "zsh-users/zsh-autosuggestions";}
		{name = "romkatv/powerlevel10k"; tags = [as:theme depth:1];}
		{name = "skywind3000/z.lua";}
	];
    };
    initExtra = ''
    if [[ -f "$HOME/.p10k.zsh" ]]; then
    source "$HOME/.p10k.zsh"
    fi
    '';
    };

  #home.file.".p10k.zsh".source = /home/michalczyz/Documents/dotfiles/p10k/.p10k.zsh; 
  home.file.".wezterm.lua".text = ''
	local wezterm = require 'wezterm'

	return {
	font = wezterm.font_with_fallback {
	'Caskaydia Cove Nerd Font',
	'Fira Code Nerd Font',
	'Cascadia Code',
	'Fira Code',
	},

	color_scheme = "Catppuccin Mocha",

	}	
  '';

  home.file.".config/awesome" = {
	source = /home/michalczyz/Documents/dotfiles/awesome/.config/awesome;
	recursive = true;
  };

  home.file.".config/nvim" = {
	source = /home/michalczyz/Documents/dotfiles/neovim/.config/nvim;
	recursive = true;
 };

  xdg.userDirs = {
  	enable = true;
  	createDirectories = true;
  	};

  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
