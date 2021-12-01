## Regolith Desktop Overlay
A gentoo overlay for the [Regolith Desktop](https://regolith-linux.org/) project. Currently incomplete.

Unless specified otherwise, all files in this repository are copyright Amelia Crate and distributed under the terms of the BSD license present in this repository.

#### A note on live ebuilds
In most cases, a live ebuild has been included when possible for each package. Upstream makes no attempt to keep the git tree in a usable (or even compile-able) state, because they package for ubuntu and debian where they only need the repository to be in a working state at the moment they cut a release.
The live ebuilds are here for testing and development purposes. Upstream will not support them at all. I will do my best to keep them working, but sometimes if the live ebuild is broken there will be no solution. Use at your own risk.

#### Adding the repository
```
eselect repository add regolith-overlay git https://github.com/a-crate/regolith-overlay.git
emaint sync -r regolith-overlay
```
