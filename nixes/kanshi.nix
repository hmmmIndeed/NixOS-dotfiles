{
	services.kanshi = {
		enable = true;
		systemdTarget = "hyprland-session.target";

		# eDP-1 is the laptop screen
		# HDMI-A-1 is the docked monitor
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
					  criteria = "eDP-1";
					  status = "enable";
					  position = "0,0";
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
					{
						criteria = "HDMI-A-1";
						status = "enable";
						position = "0,0";
					}
					{
						criteria = "eDP-1";
						status = "enable";
						position = "1920,0";
					}
        ];
      }
    ];
	};
}
# depreciated sources:
# https://discourse.nixos.org/t/starting-kanshi-via-systemd-user-swaywm/27960
# https://haseebmajid.dev/posts/2023-07-25-nixos-kanshi-and-hyprland/
# up to date sources:
# https://www.reddit.com/r/NixOS/comments/1ds8g3m/help_me_make_sense_of_kanshiprofiles_option_is/
