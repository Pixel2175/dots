### Description
Rules for floating windows support default x, y, width, height. Defaults to the center of the screen and the client size.

If the width or height is less than or equal to 1, then the value will be interpreted as a percentage. For example, 0.5 represents 50%, 0.25 represents 25%, and 1 represents 100%. **NOTE**: Some clients, like Thunar, have minimum width/height

The variable `center_relative_to_monitor` allows the user to choose whether to center relative to the monitor or relative to the window area.

<details>
<summary>Explanation of center_relative_to_monitor:</summary>
<pre>
The "Monitor area" refers to the space enclosed by the green rectangle, while the "Window area" refers to the space enclosed by the red rectangle.
<img src="https://i.imgur.com/xhejzPh.png"/>
</pre>
</details>

### Download
- [git branch](https://codeberg.org/wochap/dwl/src/branch/v0.5/customfloat)
- [wlroots-next-f4249db](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/customfloat/customfloat-wlroots-next-f4249db.patch)
- [0.8](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/customfloat/customfloat-0.8.patch)

### Authors
- [fauxmight](https://codeberg.org/fauxmight)
- [wochap](https://codeberg.org/wochap)
- [Stivvo](https://github.com/Stivvo)
