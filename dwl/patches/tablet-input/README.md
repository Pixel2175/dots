### Description
Implements wlr-tablet-v2 for drawing tablets with cursor emulation.
Inspired by @guyuming76's [branch](https://codeberg.org/guyuming76/dwl/commits/branch/graphic_tablet), with coding help from @Palanix and testing by @Thanatos.

- **Tablet area**: define the active drawing zone using the `tablet_pad` array
`{x, y, width, height}`, values range from 0.0 to 1.0 (as a fraction of the
tablet's full surface). Only input within this area is mapped to the screen.
- **Button bindings**: bind tablet pad and stylus buttons to compositor actions.

### Download
- [git branch](https://codeberg.org/pi66/dwl/src/branch/tablet-input)
- [tablet-input-main-a2d03cf.patch](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/tablet-input/tablet-input-main-a2d03cf.patch)
- [tablet-input-0.8.patch](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/tablet-input/tablet-input-0.8.patch)

### Authors
- [fauxmight](https://codeberg.org/fauxmight)
- [notchoc](https://codeberg.org/notchoc)
- [Palanix](https://codeberg.org/Palanix)
- [pi66](https://codeberg.org/pi66)
