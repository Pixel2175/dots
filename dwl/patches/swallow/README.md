### Description

This patch adds "window swallowing" to dwl.

If a user runs a graphical program from the terminal (e.g., `mpv`), the terminal
will be hidden and only a window of the newly spawned graphical program will
be visible. The terminal stays hidden until the graphical program is closed.
This patch helps users spawning a lot of graphical programs from their command
line by avoiding cluttering the screen with many unusable terminals.

`foot` is the terminal by default, you can change it in client rules in config.h.

In `2025-03-03 v0.7` version and above, the patch had been rewritten from
scratch to make it more robust and add a few more features:

- "dynamically swallow" windows by pressing `Alt+a` (a focused window will
  swallow/unswallow the previously focused one)
- toggle automatic swallowing by `Alt+Shift+a`
- if a window has swallowed another, it get thicker borders

### Download

#### swallow.patch

- [v0.7](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/swallow/swallow.patch)
- [2025-03-03 v0.7](https://codeberg.org/dwl/dwl-patches/raw/commit/2e5748edfe1129f95c7bb1bf9dd590a897f55f57/patches/swallow/swallow.patch) (added "dynamic swallowing" support)
- [2024-07-13](https://codeberg.org/dwl/dwl-patches/raw/commit/f1ed83eaeba46108f4ee8164094cb431d64a3e68/patches/swallow/swallow.patch)
- [2024-07-13](https://codeberg.org/dwl/dwl-patches/raw/commit/f64d701bab2f9f52d3637edd091684f920407d87/patches/swallow/swallow.patch)
- [2024-05-02](https://codeberg.org/dwl/dwl-patches/raw/commit/9c5d5d85f3ac780e7a14d5d0535e3349ce8b8f53/patches/swallow/swallow.patch)
- [2024-04-03](https://codeberg.org/dwl/dwl-patches/raw/commit/3c9a8e3232a8531871924484cef1ef0938730e15/swallow/swallow.patch)
- [2024-01-01](https://codeberg.org/dwl/dwl-patches/raw/commit/8a352a1b27a64821ba9fbfda52fe82463ac84c66/swallow/swallow.patch)
- [2023-10-26](https://github.com/djpohly/dwl/compare/main...youbitchoc:swallow.patch)
- [2023-08-16](https://github.com/djpohly/dwl/compare/main...mewkl:swallowx.patch) (added XWayland support)
- [2023-07-15](https://github.com/djpohly/dwl/compare/main...NikitaIvanovV:swallow.patch)
- [v0.4](https://github.com/djpohly/dwl/compare/main...dm1tz:04-swallow.patch)
- [2021-12-03](https://github.com/djpohly/dwl/compare/main...dm1tz:swallow.patch)

#### swallow-freebsd.patch

Apply this patch on top of the swallow.patch if you use FreeBSD.

- [v0.7](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/swallow/swallow-freebsd.patch)
- [2025-03-03 v0.7](https://codeberg.org/dwl/dwl-patches/raw/commit/2e5748edfe1129f95c7bb1bf9dd590a897f55f57/patches/swallow/swallow-freebsd.patch) (added "dynamic swallowing" support)
- [2024-07-13](https://codeberg.org/dwl/dwl-patches/raw/commit/f1ed83eaeba46108f4ee8164094cb431d64a3e68/patches/swallow/swallow-freebsd.patch)

### Authors

- [Nikita Ivanov](https://codeberg.org/nikitaivanov) ([GitHub](https://github.com/NikitaIvanovV))
- [Dmitry Zakharchenko](https://github.com/dm1tz)
- [Palanix](https://codeberg.org/Palanix)
- [Connor Worrell](https://github.com/ConnorWorrell)
- [Mewkl](https://github.com/mewkl)
- [Choc](https://codeberg.org/notchoc)
