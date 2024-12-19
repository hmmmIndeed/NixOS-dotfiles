# NixOS-dotfiles

## My Structure

Using both Flakes and Home Manager, I personally have everything in `~/.dotfiles`. Is a WIP.

**will make a lil tree for everything later**

### Folders in .dotfiles
* The `configs` folder contains all the folders and config files relating to non-distro-specific config files. These can be used by someone using any distro, such as Arch Linux, which is why I decided not to Nixify them (configure them with the Nix language).
* The `wallpapers` folder contains some wallpapers that I use/want to use/like.

### Files in .dotfiles

* `configuration.nix` contains the main configuration stuff, including the programs I have installed.
* `flake.lock` is the lock file for flakes, allows reproducibility I think (don't edit, will change when flakes are changed/updated)
* `flake.nix` contains flake stuff, like some package sources and user configs.
* `hardware-configuration.nix` contains my hardware config, will change per device
* `home.nix` contains home manager stuff, like some config file overriding
* `kanshi.nix` contains kanshi config which is used to configure multiple monitors (doesn't work now so Hyprland has my monitor config at the bottom of its config file in ./configs/hypr/hyprland.conf)
* `shell.nix` was gonna make a development file template for projects, extremely unfinished rn
* `sliver.nix` contains stuff to get sliver working (made by a friend); there is some stuff needed for sliver in `configuration.nix` too
* `suspend-and-hibernate.nix` has auto suspend and hibernate stuff but it doesn't work (but I found it online)
* `switch.txt` contains the common commands to update the system
* `text.nix` contains configs for fonts and fcitx5

## Programs

* fcitx5
* I'll add more later

### Fcitx5

If you install my config files, I recommend you change them via the fcitx5 configure GUI, which can be opened by right clicking the fcitx5 icon in the taskbar and choosing "Configure". I'm not sure how else to open the GUI.

Whenever you configure anything via the GUI, it'll change the files in `~/.config/fcitx5/` so make sure to copy the contents of those files in that directory to those in your Nix dotfiles.

(The configurations in the images in the following section may be outdated as the images are there to provide an example of what the GUI looks like. Make sure to restart fcitx5 when changing any options! I right click the fcitx5 icon in my taskbar and choose "Restart" but I'm not sure how else to do it...)

#### Configuring Fcitx5

##### `~/.config/fcitx5/profile` and my Nix config `./configs/fcitx5/profile`

This contains anything configured in the "Input Method" tab. You can create a group for each set of language rotations and I have this one named "eng+pinyin+rus". The default group is named "Default", which I have removed. If you will use multiple groups, choose one to add input methods to.

To add an input method, select an option from the right side of the configuration window, using the search feature and unchecking the "Only Show Current Language" option (near the bottom right of the configuration window) if necessary. When an input method is selected, the first arrow (pointing to the left) in the middle of the configuration window should turn green, allowing you to add that input method to the group.

To remove an input method from the group, select the input method on the left side of the configuration window and click the (now green) button pointing to the right.

To change the order of the input methods in the group, select the input method on the left side of the configuration window and use the green up or down arrows in the middle of the configuration window to reorder the input methods. 
![image](https://github.com/user-attachments/assets/0e44bc1d-ef95-4265-ac6f-934a8e38dff2)

##### `~/.config/fcitx5/config` and my Nix config `./configs/fcitx5/config`

This contains anything configured in the "Global Options" tab. The "Global Options" tab:
![image](https://github.com/user-attachments/assets/bc37c59d-e9ec-4c47-9855-305bf92a34fa)

##### `~/.config/fcitx5/conf` folder and my Nix config `./configs/fcitx5/conf`

This contains anything configured in the "Addons" tab. A file will be made once an option in any of the settings is changed from the default. The "Addons" tab:
![image](https://github.com/user-attachments/assets/2c6511a0-dbf3-43b2-9273-67300681cfaa)
