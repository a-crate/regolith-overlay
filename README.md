## Regolith Desktop Overlay
A gentoo overlay for the [Regolith Desktop](https://regolith-linux.org/) project. Currently in a working state, but still in development.

Unless specified otherwise, all files in this repository are copyright Amelia Crate and distributed under the terms of the BSD license present in this repository.

### Configuring regolith

#### Runtime configuration
Regolith has a lot of keybindings, press Super+Shift+? to launch the keybinding viewer if you are unsure how to do something.

##### Configuration files
Regolith communicates with itself primarily through Xresource definitions. The easiest way to customize regolith is by setting the appropriate Xresource. If you don't want to set them globally, you can edit the ~/.config/regolith/Xresources file which will be loaded only for regolith.
For example, the following snippet will swap the primary and second mod keys (Super and Alt by default):
```
i3-wm.mod: Mod1
i3-wm.alt: Mod4
i3-wm.binding.file_search: Mod4
i3-wm.binding.ws_next2: Mod4+Right
i3-wm.binding.ws_prev2: Mod4+Left
i3-wm.binding.take_next_free: Mod4+grave
i3-wm.binding.look_selector: Mod4+l
```
This swap will be simpler in the regolith 2.0 release. The keybind viewer will still show the original mod keys unless you edit the regolith i3 configuration.
To do so, run `regolith-look stage` to copy the regolith default configuration files to ~/.config/regolith, and edit the comments above each keybinding in ~/.config/regolith/i3/config

##### regolith-look

Changing the regolith theme can be done with the `regolith-look` tool. `regolith-look list` will show available themes, `regolith-look set gruvbox` will change the theme, and `regolith-look refresh` will reload the theme. Themes primarily consist of sets of Xresource definitions that regolith checks to set the gtk theme, i3wm colors, rofi theme, etc. 

#### USE Flags
Upstream generally relies on virtual packages with differing dependencies to configure the system. This repository generally relies on USE flags instead. As an example: upstream provides the packages `regolith-full regolith-desktop regolith-mobile` which each pull in different sets of modules for i3xrocks (the regolith status bar).
This is controlled by USE flags for each module instead in this repository. The following packages have USE flags you may want to edit:

x11-misc/regolith-i3xrocks-config allows for selection of modules in the status bar

x11-misc/regolith-desktop allows a selection of which compositor to use (and, eventually, whether to use i3 or i3-gaps once upstream properly supports both)

x11-misc/ayu-gtk-theme allows a selection of gtk versions and window managers to support

x11-misc/solarc-gtk-theme allows a selection of gtk versions and window managers to support

x11-themes/regolith-styles allows a selection of regolith themes to install

### A note on live ebuilds
In most cases, a live ebuild has been included when possible for each package. Upstream makes no attempt to keep the git tree in a usable (or even compile-able) state, because they package for ubuntu and debian where they only need the repository to be in a working state at the moment they cut a release.
The live ebuilds are here for testing and development purposes. Upstream will not support them at all. I will do my best to keep them working, but sometimes if the live ebuild is broken there will be no solution. Use at your own risk.

### Adding the repository
```
eselect repository add regolith-overlay git https://github.com/a-crate/regolith-overlay.git
emaint sync -r regolith-overlay
emerge -av x11-misc/regolith-desktop
```

### Keywords
I don't have access to any hardware other than amd64, so that is the only `~arch` keyword that will be present in this repository. Live ebuilds will have no keywords as usually, and nothing will be keyworded `arch`.
Other `~arch` keywords may be added if I get access to other hardware. On amd64, you will need the following keyword changes to emerge everything in this repository:
```
*/*::regolith-overlay ~amd64
media-fonts/iosevka::gentoo ~amd64
gnome-base/gnome-flashback::gentoo ~amd64
gnome-base/gnome-panel::gentoo ~amd64
x11-wm/metacity::gentoo ~amd64
```
