## Regolith Desktop Overlay
A gentoo overlay for the [Regolith Desktop](https://regolith-linux.org/) project. Currently incomplete.

Unless specified otherwise, all files in this repository are copyright Amelia Crate and distributed under the terms of the BSD license present in this repository.

#### Configuring regolith
Upstream generally relies on virtual packages with differing dependencies to configure the system. This repository generally relies on USE flags instead. As an example: upstream provides a regolith-full regolith-desktop and regolith-mobile package which each pull in different sets of modules for i3xrocks (the regolith status bar).
In this overlay, the USE flags for the x11-misc/regolith-i3xrocks-config package enable or disable each module individually. Other packages you want to want to toggle USE flags for:

x11-misc/regolith-desktop, which allows a selection of which compositor to use (and, eventually, whether to use i3 or i3-gaps once upstream properly supports both)

x11-themes/regolith-styles, which will pull in regolith themes (and their gtk and icon theme complements) based on USE flags

#### A note on live ebuilds
In most cases, a live ebuild has been included when possible for each package. Upstream makes no attempt to keep the git tree in a usable (or even compile-able) state, because they package for ubuntu and debian where they only need the repository to be in a working state at the moment they cut a release.
The live ebuilds are here for testing and development purposes. Upstream will not support them at all. I will do my best to keep them working, but sometimes if the live ebuild is broken there will be no solution. Use at your own risk.

#### Adding the repository
```
eselect repository add regolith-overlay git https://github.com/a-crate/regolith-overlay.git
emaint sync -r regolith-overlay
```
