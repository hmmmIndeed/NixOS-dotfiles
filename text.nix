{ config, pkgs, inputs, ... }:

{
  # Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    font-awesome
  ];

  # Fcitx5
  i18n.inputMethod = {
  	enabled = "fcitx5";
  	fcitx5.addons = with pkgs; [
  	  fcitx5-gtk
  	  fcitx5-chinese-addons
  	  fcitx5-rime
  	  rime-data
  	  fcitx5-mozc
      libime
      fcitx5-table-extra
      fcitx5-mcbopomofo
    ];
  };

  home.file = {
    # Fcitx
	".config/fcitx5/config" = {
	  source = config.lib.file.mkOutOfStoreSymlink ./configs/fcitx5/config;
    force = true;
	};
	".config/fcitx5/profile" = {
	  source = config.lib.file.mkOutOfStoreSymlink ./configs/fcitx5/profile;
    force = true;
	};
#	".config/fcitx5/conf/chttrans.conf" = {
#	  source = config.lib.file.mkOutOfStoreSymlink ./configs/fcitx5/conf/chttrans.conf;
#	};
#	".config/fcitx5/conf/pinyin.conf" = {
#	  source = config.lib.file.mkOutOfStoreSymlink ./configs/fcitx5/conf/pinyin.conf;
#	};
#	".config/fcitx5/conf/punctuation.conf" = {
#	  source = config.lib.file.mkOutOfStoreSymlink ./configs/fcitx5/conf/punctuation.conf;
#	};
#    ".config/environment.d/envvars.conf" = {
#      source = config.lib.file.mkOutOfStoreSymlink ./configs/environment.d/envvars.conf;
#    };
  };

}
