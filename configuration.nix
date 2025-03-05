{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
#  boot.loader.systemd-boot.enable = true;
#  boot.loader.efi.canTouchEfiVariables = true;
  # OS-Prober
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  
  nix.settings.experimental-features =[ "nix-command" "flakes" ];

  # networking stuff
  # defines the hostname
  networking.hostName = "eva";
	networking.networkmanager = {
    # enables networking
		enable = true;
		plugins = [ pkgs.networkmanager-openvpn ];
		#dns = "none";
	};
	networking.firewall.enable = false;
	#networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
	#programs.openvpn3.enable = true;


  systemd.network.enable = true;
  systemd.network.wait-online.enable = false;
  services.resolved = {
    enable = true;
    dnsovertls = "opportunistic";
    dnssec = "false";
    fallbackDns = [
      "9.9.9.9"
      "127.0.0.1"
    ];
    extraConfig = "Domains=~.";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.asulk = {
    isNormalUser = true;
    description = "asulk";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "video"
      "audio"
      "disk"
      "vboxusers"
      # to install grapheneos on pixel
			"adbusers"
			"kvm"
    ];
    group = "users";
    home = "/home/asulk";
    uid = 1000;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    #neovim
    lf
    git
    aquamarine
    hyprland
    kitty
    waybar
    ags
    hyprpaper
    wofi
    mako
    libnotify
    pipewire
    wl-clipboard
    networkmanagerapplet
    fcitx5

    # everything needed for thunar
    xfce.thunar
    xfce.tumbler
    gvfs

    dmenu
    cliphist
    slurp
    grim
    firefox
    
    fuse
    ntfs3g
    
    vscode
    python3
    librewolf
    ungoogled-chromium
    google-chrome
    neofetch
    zoom-us
    protonvpn-cli_2
    protonvpn-gui
    wireguard-tools sof-firmware
    alsa-utils
    clipse
    zathura
    fzf
    udiskie
    dbus
    # for libreoffice
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.ru_RU
    
    os-prober
    file
    sioyek
    zip
    unzip
    ghidra
    spotify
    nmap
    inetutils
    qemu
    virt-manager
    alacritty
    foot
    xournalpp
    brightnessctl
    osu-lazer-bin
    anki
    meson
    ninja
    appimage-run
    vesktop
    wireshark
    kanshi
    cmake
    gnumake
    #(pkgs.callPackage ./nixes/sliver.nix {})
    #openvpn
    android-tools
    android-udev-rules
    usbutils
    tmux
    remmina
    hyprutils
    niv
    hyprsunset
    hyprlock
    vscode
    joplin-desktop
    onlyoffice-desktopeditors
    pwndbg
    hyprpolkitagent
    signal-desktop
    inkscape
    gnome-keyring
    libsecret
    seahorse
    python313Packages.proton-keyring-linux
    trashy
    vlc
    p7zip
    emacs
    mlocate
    gtk3
    zellij
  ];
  
  # using Cachix so I don't have to compile Hyprland myself
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  
	programs = {
		# Hyprland nixpkg
		hyprland = {
			enable = true;
			xwayland.enable = true;
# this line bugs
#    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
# sets hyprland to the stable package
		#package = inputs.hyprland.${pkgs.system}.packages.hyprland;
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
		portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
		};

		nix-ld.enable = true;
		nix-ld.libraries = with pkgs; [];

		appimage.binfmt = true;
		
		# Steam
		steam.enable = true;

		# Android Debug Bridge (needed to install GrapheneOS)
		adb.enable = true;

		# Neovim
		neovim = {
			enable = true;
			defaultEditor = true;
			configure = {
				packages.myVimPackage = with pkgs.vimPlugins; {
					start = [
						nvim-treesitter.withAllGrammars # text highlighting
						kanagawa-nvim # kanagawa theme
						vim-nix # nix highlighting
            nerdtree # file structure inside nvim
            which-key-nvim # shows keybindings
            nvim-surround # shortcuts for setting (), {}, etc.
            rainbow-delimiters-nvim # colored parenthesis
					];
				};
				customRC = builtins.readFile ./configs/nvim/init.vim;
			};
		};
	};
  
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  #sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

#  xdg.configFile."/home/asulk/.config/fcitx5/profile".force = true;

  services.upower = {
    enable = true;
    criticalPowerAction = "Hibernate";
  };

  virtualisation.libvirtd.enable = true;
  #boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
	programs.virt-manager.enable = true;
  virtualisation.virtualbox.host.enable = true;
	users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

#  virtualisation.libvirtd = {
#		enable = true;
#		qemu = {
#			package = pkgs.qemu_kvm;
#			runAsRoot = true;
#			swtpm.enable = true;
#			ovmf = {
#				enable = true;
#				packages = [(pkgs.OVMF.override {
#					secureBoot = true;
#					tmpSupport = true;
#				}).fd];
#			};
#		};
#	};


	hardware.bluetooth.enable = true;
	services.blueman.enable = true;



#	programs.nvf = {
#		enable = true;
#		enableManpages = true;
#		settings.vim = {
#		  languages = {
##				enableDAP = true;
##				enableLSP = true;
##				enableTreesitter = true;
##				bash = {
##					enable = true;
##					format.enable = true;
##				};
#		    clang = {
#          enable = true;
#          cHeader = true;
#	  	  	dap.enable = true;
#	  	  };
##				nix = {
##					enable = true;
##					format.enable = true;
##					extraDiagnostics.enable = true;
##				};
##				python = {
##					enable = true;
##					format.enable = true;
##				};
#			};
##		  autopairs.enable = true;
##		  debugMode.enable = true;
##		  debugger.nvim-dap.enable = true;
##		  debugger.nvim-dap.ui.enable = true;
##		  filetree.neo-tree.enable = true;
##			treesitter.enable = true;
##			treesitter.highlight.enable = true;
#      # basic configs
#      syntaxHighlighting = true;
#      useSystemClipboard = true;
##      lineNumberMode = "relNumber";
#      options = {
#        shiftwidth = 2;
#        tabstop = 2;
#        termguicolors = true;
#      };
#
#      minimap.codewindow.enable = true;
#      projects.project-nvim.enable = true;
#      telescope.enable = true;
#      terminal.toggleterm.enable = true;
#      ui.colorizer.enable = true;
#      utility.images.image-nvim.enable = true;
#      visuals.scrollBar.enable = true;
#    };
#
#	};
  
  services.udisks2.enable = true;
  security.polkit = {
    enable = true;
#    extraConfig = "
#      polkit.addRule(function(action, subject) {
#        var YES = polkit.Result.YES;
#        var permission = {
#          // required for udisks1:
#          "org.freedesktop.udisks.filesystem-mount": YES,
#          "org.freedesktop.udisks.luks-unlock": YES,
#          "org.freedesktop.udisks.drive-eject": YES,
#          "org.freedesktop.udisks.drive-detach": YES,
#          // required for udisks2:
#          "org.freedesktop.udisks2.filesystem-mount": YES,
#          "org.freedesktop.udisks2.encrypted-unlock": YES,
#          "org.freedesktop.udisks2.eject-media": YES,
#          "org.freedesktop.udisks2.power-off-drive": YES,
#          // required for udisks2 if using udiskie from another seat (e.g. systemd):
#          "org.freedesktop.udisks2.filesystem-mount-other-seat": YES,
#          "org.freedesktop.udisks2.filesystem-unmount-others": YES,
#          "org.freedesktop.udisks2.encrypted-unlock-other-seat": YES,
#          "org.freedesktop.udisks2.encrypted-unlock-system": YES,
#          "org.freedesktop.udisks2.eject-media-other-seat": YES,
#          "org.freedesktop.udisks2.power-off-drive-other-seat": YES
#        };
#        if (subject.isInGroup("dev")) {
#          return permission[action.id];
#        }
#      });     
#    ";
  };

#  nix.gc = {
#    automatic = true;
#    dates = "monthly";
#    options = "--delete-older-than 31d";
#  };
#
#  hardware.opentabletdriver = {
#    enable = true;
#    daemon.enable = true;
#  };


#  systemd.user.services.kanshi = {
#    enable = true;
#    description = "kanshi daemon";
#    systemdTarget = "";
#  };

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
  system.stateVersion = "23.11"; # Did you read the comment?

}
