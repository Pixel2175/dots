### Description

Add a bar identical to dwm's bar.

To use a status-bar, you can pass in status text via stdin:
```
slstatus -s | dwl
```

### Dependencies
* tllist (build dependency, required & pulled automatically by fcft)
* fcft
* pixman

### Download
- [main 2026-01-05](/dwl/dwl-patches/raw/branch/main/patches/bar/bar.patch)
- [0.7](/dwl/dwl-patches/raw/branch/main/patches/bar/bar-0.7.patch)
- [0.6](/dwl/dwl-patches/raw/branch/main/patches/bar/bar-0.6.patch)

It is required to remove, regenerate or update `config.h` after applying the patch,
since it makes changes to the configuration structure.
For example, in the `pertag` patch, `TAGCOUNT` must be replaced with `LENGTH(tags)`.

Below is a preview of the patch.

![bar patch preview](bar.png)

### Authors
- [sewn](https://codeberg.org/sewn)

### Credits
- [MadcowOG](https://github.com/MadcowOG)
- [kolumni](https://github.com/kolunmi/dwlb)

