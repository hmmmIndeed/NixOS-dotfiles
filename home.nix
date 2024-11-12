{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "asulk";
  home.homeDirectory = "/home/asulk";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # to delete ~/.config/fcitx5/profile since it's the .config ver of profile
  #xdg.configFile."~/.config/fcitx5/profile".force = true;
  #home-manager.backupFileExtension = "backup";
  #https://discourse.nixos.org/t/way-to-automatically-override-home-manager-collisions/33038
  #https://nix-community.github.io/home-manager/nixos-options.xhtml
  #^the first one: home-manager.backupFileExtension

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Hyprland
    ".config/hypr/hyprland.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink ./configs/hypr/hyprland.conf;
    };
    #".config/hypr/hyprland.conf".source = ./configs/hypr/hyprland.conf;
		# Hyprpaper
    ".config/hypr/hyprpaper.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink ./configs/hypr/hyprpaper.conf;
    };
    # Neovim
#    ".config/nvim/init.lua" = {
#      source = config.lib.file.mkOutOfStoreSymlink ./configs/nvim/init.lua;
#    };
    # Waybar
    ".config/waybar/config" = {
      source = config.lib.file.mkOutOfStoreSymlink ./configs/waybar/config;
    };
    ".config/waybar/style.css" = {
      source = config.lib.file.mkOutOfStoreSymlink ./configs/waybar/style.css;
    };
    # Kitty
    ".config/kitty/kitty.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink ./configs/kitty/kitty.conf;
    };
		# Foot
    ".config/foot/foot.ini" = {
      source = config.lib.file.mkOutOfStoreSymlink ./configs/foot/foot.ini;
    };

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/asulk/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
#      ll = "ls -l";
#      ".." = "cd ..";
    };
  };
  
  # adds the home manager module for ags
  #imports = [ inputs.ags.homeManagerModules.default ];
  #programs.ags = {
  #  enable = true;
  #  configDir = ./configs/ags;
  #  # additional packages to add to gjs's runtime
  #  extraPackages = with pkgs; [
  #    gtksourceview
  #    webkitgtk
  #    accountsservice
  #  ];
  #};

  # adds the phinger cursor theme
  home.pointerCursor = {
    name = "phinger-cursors-dark";
	package = pkgs.phinger-cursors;
	size = 24;
	gtk.enable = true;
  };

# this bugs it
  # Hyprland flake
#  wayland.windowManager.hyprland = {
#    enable = true;
#    xwayland.enable = true;
#    plugins = [
#      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
#    ];
#  };


}
