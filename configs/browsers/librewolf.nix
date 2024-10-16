{ config, pkgs, ... }:

	let
		lock-false = {
			Value = false;
			Status = "locked";
		};
		lock-true = {
			Value = true;
			Status = "locked";
		};
	in
{
	programs = {
		librewolf = {
			enable = true;
			languagePacks = [ "en-US" ];

			# policies
			# policy options are at: about:policies#documentation
			policies = {

			};

			# extensions
			# extension/add-on ID strings are at: about:support
			ExtensionSettings = {
				"*".installation_mode = "blocked"; # blocks all addons except those specified below
				# uBlock Origin:
				"uBlock0@raymondhill.net" = {
					install_url = "https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/latest.xpi";
					installation_mode = "force_installed";
				};
				# Bitwarden
				"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
					install_url = "https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/latest.xpi";
					installation_mode = "force_installed";
				};
				# Auto Tab Discard
				"{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
					install_url = "https://addons.mozilla.org/en-US/firefox/addon/auto-tab-discard/latest.xpi";
					installation_mode = "force_installed";
				};
				# LeechBlock NG
				"leechblockng@proginosko.com" = {
					install_url = "https://addons.mozilla.org/en-US/firefox/addon/leechblock-ng/latest.xpi";
					installation_mode = "force_installed";
				};
				# Clockify Time Tracker
				"{1262fc44-5ec9-4088-a7a7-4cd42f3f548d}" = {
					install_url = "https://addons.mozilla.org/en-US/firefox/addon/clockify-time-tracker/latest.xpi";
					installation_mode = "force_installed";
				};
				# Awesome Screenshot: Screen capture, Annotate
				"jid0-GXjLLfbCoAx0LcltEdFrEkQdQPI@jetpack" = {
					install_url = "https://addons.mozilla.org/en-US/firefox/addon/screenshot-capture-annotate/latest.xpi";
					installation_mode = "force_installed";
				};
				# Take Webpage Screenshots Entirely - FireShot
				"{0b457cAA-602d-484a-8fe7-c1d894a011ba}" = {
					install_url = "https://addons.mozilla.org/en-US/firefox/addon/fireshot/latest.xpi";
					installation_mode = "force_installed";
				};

				# Preferences
				Preferences = {

				};
			};
		};
	};
};
