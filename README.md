gr-minecraft
============

A frequency display within Minecraft using [OpenComputers](https://github.com/MightyPirates/OpenComputers).
Uses [GNU Radio](https://github.com/gnuradio/gnuradio) and the TCP sink in server mode to send bytes and update a Minecraft-enabled 16-bin frequency display.

Install
=======

First install Minecraft, followed by [Forge](http://files.minecraftforge.net), and then OpenComputers.
Just grab Minecraft and the Forge installers, and then copy the
[OpenComputers](http://www.curse.com/mc-mods/minecraft/223008-opencomputers) jar to
.minecraft/mods folder.
On windows, this usually corresponds to the C:/Users/username/AppData/Roaming/.minecraft/mods path.

Screenshots
===========

**Frequency display showing the magnitude output of a tone over 16 bins.**
![](https://github.com/daulpavid/gr-minecraft/blob/master/screenshots/freqdisplay.png)

**GNU Radio Companion Flow Graph (No USRP connected)**
![](https://github.com/daulpavid/gr-minecraft/blob/master/screenshots/grc.png)

**The OpenComputers master controller. Opens a TCP connection to GNU Radio.**
![](https://github.com/daulpavid/gr-minecraft/blob/master/screenshots/mastercomputer.png)
