{
	services.kanshi = {
		enable = true;
		systemdTarget = "hyprland-session.target";

		# eDP-1 is the laptop screen
		# DP-2 is the docked monitor
		profiles = {
			# when second monitor isn't in use
			undocked = {
				outputs = [
					{
						criteria = "eDP-1";
						status = "enable";
						position = "0,0";
					}
				];
			};
			# when second monitor is in use
			docked = {
				outputs = [
					{
						criteria = "eDP-1";
						status = "enable";
					}
					{
						criteria = "HDMI-A-1";
						status = "enable";
						position = "0,0";
					}
				];
			};
		};
	};
};
# sources:
# https://discourse.nixos.org/t/starting-kanshi-via-systemd-user-swaywm/27960
# https://haseebmajid.dev/posts/2023-07-25-nixos-kanshi-and-hyprland/
