![IMG20220618163426 - Copy](https://user-images.githubusercontent.com/36605644/174472050-c643f2aa-f4e9-433c-a007-6438bcb5a908.jpg)

# Welcome to the iNap Malinka main page!
Here you'll find everything about the project. Remember that it's still work in progress, so be prepared for changes!
Consider donating me so I can order buy more milk:

<a href='https://ko-fi.com/V7V2B5527' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi3.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

## What's iNap Malinka?
It was mostly made as a decent Raspberry based NRF24L01 transmitter, but as it turns out you can play some games on this. It's based on RetroPie so any retro game, including ports, can be played on this. But as it's mostly a device for tinkering on-the-go, there's additional USB for any kind of peripheral, HDMI port, and a decent audio section to work as a little function generator.
Not only that, it's as big as your phone, with only 12mm thickness. Two joysticks, 3.5" capacitive touch screen, powered by Raspberry Pi Zero 2W.  
But, if you're just interested about gaming, you can totally ignore the radio section and use it as a small, DIY handheld.

## Why Malinka?
* extremely small size compared to other pi handhelds
* big, colorful LCD with touch!
* two joysticks allowing to play more modern games
* NRF24L01 radio makes it a perfect remote!!
* only 3 external ICs, without any aux microcontroller
* stereo sound output and a headphone jack
* with a keyboard, it can act as a little PC
* uses parts of Nintendo Switch
## Why NOT?
* if you're a fan of Steam Deck, this device is probably too small for you
* lack of joystick pushbuttons as well as analog triggers
* many tools needed to assembly, including a 3D printer
* intermediate soldering skills are needed
* uses parts of Nintendo Switch

## Specifications
* 3.5" 480x320 ILI9488 screen with FT6206 capacitive touch controller
* Raspberry Pi Zero 2W with possible OC
* 1500mAh lipo battery
* 160x70x12mm (with case)
* two joysticks with 10 bit ADC MCP3008
* PAM8403 amplifier, stereo
* NRF24L01 PA+LNA radio with optional, external antenna
* Micro-USB for peripherals and USB-C for charging
# Kits
There aren't any kits at the moment, and probably there won't be any. You'll need to buy everything by yourself - please visit the [wiki](https://github.com/Leoneq/iNapMalinka/wiki).
# Updates
I'm going to update the project as needed, although more significant changes will go to Malinka v2 - stay tuned. You can follow me on [my twitter](https://twitter.com/leoneq112) for small updates on the project.  
You can also consider supporting me on my [kofi page](https://ko-fi.com/leoneq)!  
EasyEDA project: [link](https://oshwlab.com/leoneq/konsola)

# UPCOMING CHANGES FOR THE NEW VERSION:  
* ✔️ add test pads  
* ✔️ change layout so touch connector is in place  
* ✔️ change cutout so triggers can be printed w/o supports  
* ✔️ change power switch to smd one, and re-route battery charger
* ❌ <s>move to eagle instead of easyeda</s> fuck new eagle they broke it so much 
* ✔️ change normal nrf to version with pa+lna
* ❌ add a soundcard via i2s (cannot have spi1 and i2s at once)
* ✔️ or improve pwm soundcard
* ✔️ make layout symmetric (?)
* ✔️ instead of using cutout, make a huge pad for screen cable
* ❌ move the pi so it doesn't need to be cut: +10mm length or a cut pi.
* ✔️ remodel buttons as needed (guides, holes, flat shape)
* ✔️ merge usb user with usb charge into one usb c
* ✔️ test parallel connection - useless, we stay with spi
* ✔️ stereo sound output
* ✔️ speaker enclosures 
* ✔️ usb c charging
* ❌ consider cm4 instead of zero2w - cm4 is an overkill for this
* ✔️ make a border in the case for matching
* ✔️ isolate audio power from the board
* make an automated install script
* also an os image would be nice
* ✔️ fix battery voltage divider
* if you have more ideas, contact me!

Again, I strongly recommend to wait for the new board version. In the current one not everything works.

### License
Licensed under CC BY-NC-SA 4.0 - that means you can share, contribute, modify and remix the source as much as you want!
Please remember to mention the original author and dont change the licence. If you want to use it commercially, contact me. 
Remember that anything you do is on your own risk - the author **is not** responsible for anything you do. Good luck!!  

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>

made with ❤ and 🥛 by  
[@leonek112](https://twitter.com/leoneq112)
