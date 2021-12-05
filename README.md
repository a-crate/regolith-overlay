## Regolith Desktop Overlay
A gentoo overlay for the [Regolith Desktop](https://regolith-linux.org/) project.

Unless specified otherwise, all files in this repository are copyright Amelia Crate and distributed under the terms of the BSD license present in this repository.

#### Configuring regolith
Upstream generally relies on virtual packages with differing dependencies to configure the system. This repository generally relies on USE flags instead. As an example: upstream provides the packages `regolith-full regolith-desktop regolith-mobile` which each pull in different sets of modules for i3xrocks (the regolith status bar).
This is controlled by USE flags for each module instead in this repository. The following packages have USE flags you may want to edit:

x11-misc/regolith-i3xrocks-config allows for selection of modules in the status bar

x11-misc/regolith-desktop allows a selection of which compositor to use (and, eventually, whether to use i3 or i3-gaps once upstream properly supports both)

x11-misc/ayu-gtk-theme allows a selection of gtk versions and window managers to support

x11-misc/solarc-gtk-theme allows a selection of gtk versions and window managers to support

x11-themes/regolith-styles allows a selection of regolith themes to install

#### A note on live ebuilds
In most cases, a live ebuild has been included when possible for each package. Upstream makes no attempt to keep the git tree in a usable (or even compile-able) state, because they package for ubuntu and debian where they only need the repository to be in a working state at the moment they cut a release.
The live ebuilds are here for testing and development purposes. Upstream will not support them at all. I will do my best to keep them working, but sometimes if the live ebuild is broken there will be no solution. Use at your own risk.

#### Adding the repository
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
