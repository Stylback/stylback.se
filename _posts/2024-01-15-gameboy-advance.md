---
title: "Bringing a Game Boy Advance into the 2020s"
categories: repair
updated: 2024-03-03
---

As a child growing up in the early 2000s, I have fond memories of playing *Pokémon Yellow* and *Harry Potter and the Philosopher's Stone* on my [Game Boy Color](https://en.wikipedia.org/wiki/Game_Boy_Color). Over time, nostalgia have carved out a soft spot in me for the Game Boy consoles. I've more than once considered taking the dive back in, so you can imagine my joy when I was offered a [Game Boy Advance](https://en.wikipedia.org/wiki/Game_Boy_Advance) (GBA) in need of maintenance free of charge. It had come as a hand-me-down from a family friend around 2010 and, due to a lack of game cartridges, successively been left it in a drawer until it was graciously given to me.

The years had not been kind to it, there were multiple scratches on both case and screen as well as an accumulation of dust and grime. Originally white, the case had yellowed due to [degradation](https://en.wikipedia.org/wiki/Photo-oxidation_of_polymers) of the ABS plastic, not at all unexpected from a console over 20 years old. The original battery lid had been replaced with a black spare which, while functional, was quite an eye-sore when combined with the yellowed case. In addition, there were a pair of AA alkaline batteries still in the battery compartment. These batteries had expired in 2009 and left green-white residue in the compartment as a result of leakage.

| ![](/assets/media/gameboy-advance/front_dirty.jpg) | ![](/assets/media/gameboy-advance/wikimedia_gameboy.jpg) |
| :---: | :---: |
| *Yellowed case and scratches.* | *Original artic-white color of the GBA. Source: [Wikimedia](https://commons.wikimedia.org/wiki/File:Wikipedia_gameboyadvance.jpg) Copyright: Public Domain.* |

The model number on the back (AC19769877) tells us it was manufactured for the European market. Opening the battery lid, the silkscreen visible through a small slit (02 8-1) tells us the motherboard is a 40-pin model as supposed to a 32-pin one.

| ![](/assets/media/gameboy-advance/motherboard_model.jpg) |
| :---: |
| *Motherboard silkscreen visible through a slit in the battery compartment, the 0 tells us it's a 40-pin model.* |

## Does it turn on?

Before I could test whether the console is still operational I had to clean the battery compartment. After removing the battery lid, the battery terminal on the left was next. There is a metallic protrusion in the middle of the terminal pushing up against the plastic housing, to remove the terminal I had to wedge a flathead screwdriver between the protrusion and the plastic wall while pulling upwards with a tweezer.

| ![](/assets/media/gameboy-advance/back_dirty.jpg) |
| :---: |
| *Battery compartment with residue, the left metal terminal removed.* |

With the terminal out, the compartment could be cleaned with relative easy. As the residuals came from alkaline batteries (basic on the pH scale) it was best removed with a mild acid. I opted for food-grade citric acid (E330) diluted in warm water, I then dipped a soft toothbrush in the solution and scrubbed both the battery terminal and the internals of the compartement. Care had to be taken not to let the solution drip through to the motherboard, potentially damaging it. The reaction between the residual and the acid produced fizzling foam, when the fizzle stopped I dried the compartement with a cloth and left to dry. An hour later, fresh batteries were inserted, the console turned on and I was greeted me with the nostalgic Game Boy logo and chime.

<video
    height="800"
    controls
    autoplay
    preload="auto">
    <source src="/assets/media/gameboy-advance/gameboy_chime.webm" type="video/webm" />
</video>

## Disassembly

Relieved that the console was in a working condition, I opted for a complete disassembly. The top and bottom halves of the case is held is held together by six tri-point screws (size Y2.0 head) accessible from the outside and one cross-shaped screw (size 0) accessible through the battery compartement. After seperating these two halves I was met by the backside of the motherboard. A timestamp on the upper left (2001) tells us the unit was manufactured during week 20 (May 13th - 19th) of 2001. Considering the official European release of the GBA on June 22, 2001, it would be fair to assume that this unit was amongst the first to hit the European market.

| ![](/assets/media/gameboy-advance/back_screws.png) |
| :---: |
| *Screws* |

Found on the top of the motherboard, the ribbon display cable needs to be disconnected from its adapter by pushing the two locks out on either side of it. Great care should be taken as the locks for the adapter are fragile and not easily replacable. I used the flat end of a plastic spudger, working close to the board to reduce the likelihood of slipping. With the locks fully extended the ribbon cable could be gently pulled out from the adapter. Moving on, three additional cross-shaped screws (size 0 head) can be found holding the motherboard to the front-half of the case. These needs to be removed to access the display assembly.

| ![](/assets/media/gameboy-advance/internal_screws.png) |
| :---: |
| *Screws* |

The motherboard can now be separated from the front along with buttons and sideclips, the display assembly can be removed in it's entirely from the front case using some gentle prying. Here I did not pay enough attention to the force used and accidentaly ripped the isolating foam on the back of the assembly.

| ![](/assets/media/gameboy-advance/disassembly_half.jpg) |
| :---: |
| *Screws* |

Returning to the back half of the case, a long metal bracket is held in place using four cross-shaped screws (size 0 head). From this side, removing the battery terminal was a breeze. One final step to the disassembly was to pull out the small metal clips inbedded in the shoulder buttons.

| ![](/assets/media/gameboy-advance/disassembly_full.jpg) |
| :---: |
| *All parts* |

With the console disassembled it was time for a deep-clean. The motherboard, screws and loose metal pieces were cleaned using cotton swabs dipped in isopropanyl alcohol (98%). The case, buttons and the soft conductive pads were scrubbed in soapy water using a toothbrush. After the parts had been throughly dried, the console was reassembled. To test that everything from speakers to buttons worked as intended, I bought an original *Harry Potter and the Champer of Secrets* game cartridge second hand.

| ![](/assets/media/gameboy-advance/hp_cartridge.jpg) |
| :---: |
| *Harry Potter cartridge* |

## The Game Situation

The last game to be released for the GBA was in 2008, Nintendo successively ceased production of the console at the end of 2009. As such, no new game cartridges have been manufactured and sold for the GBA for over a decade. As a result, if you're looking to play one of your childhood favourites you are presented with four options:

1.  You can buy an authentic game cartridge second hand.
2.  You can buy a bootleg copy of the game.
3.  You can buy a so-called flash cartridge and play any game you want.
4.  You can forget about the console altogether play any game you want on your phone or computer through an emulator.

If it wasn't the case that original cartridges are prohibitively expensive on the second hand market, I would've opted for the first option for the "authetic" experience. However, as cartridges for games such as *Pokémon Emerald* and *The Legend of Zelda: A Link to the Past* starts at around 150 EUR, I have taken the more pragmatic option 3.

I ordered the [EZ-FLASH OMEGA Definitive Edition](https://www.ezflash.cn/product/ez-flash-omega-definitive-edition/) (ODE), it was both cheaper and had more features compared to other premium options such as the [Everdrive Mini](https://krikzz.com/our-products/cartridges/everdrive-gba-mini.html). Among the more notable features of the model is on-board emulation, it's able to run Gameboy, Gameboy Color and NES games in addition to running GBA games natively. The ODE also features ferroelectric RAM which does not depend on an internal battery to store save data.

As with most flash cartridges, you download game files (ROMs) from online archives such as [Vimm's Lair](https://vimm.net/) or [Internet Archive](https://archive.org/), you then transfer these files over to the cartridge using an adapter or SD card. On the ODE, this transfer is facilitated through a MicroSD card, which can be any size between 4GB to 128GB. The MicroSD card needs to be prepared correctly per [EZ-FLASHs instructions](https://www.ezflash.cn/omegade-en.pdf) prior to inserting it into the ODE.

My ODE came with a 16GB MicroSD card included. It had already been prepared beforehand by the reseller, however I was met with read7write issues when trying to transfer ROMs and decided to format it manually instead. After formatting it as FAT32 I downloaded the necessary files from the [EZ-FLASH download page](https://www.ezflash.cn/download/), transfered them over together with some ROMs and a firmware update and inserted it into the ODE.

| ![](/assets/media/gameboy-advance/ode_kit.jpg) |
| :---: |
| *Description* |

With regards to GBA games, the ODE plays them flawlessly. I did however notice some visual artifacts while playing the Game Boy Color version of *Harry Potter and the Philosopher's Stone*, it seems to be a limitation of the [Goomba Color emulator](https://www.dwedit.org/gba/goombacolor.php) that some color palettes are not properly translated. Some enthusiasts suggest that this is fixable by flashing custom firmware, which would enable the use of different emulators. While interesting, the artifacts are not such big an issue that I would want to risk bricking my ODE. Perhaps a project for another time.

| ![](/assets/media/gameboy-advance/gbc_artifact_1.jpg) | ![](/assets/media/gameboy-advance/gbc_artifact_2.jpg) |
| :---: | :---: |
| *Image of visual artifact in GBC* | *Image of visual artifact in GBC* |

## Backlight

A modern LCD display, such as the one in a smartphone, have a layer of white LEDs that shine light up through the rest of the screen layers. This layer is called a backlight and a display that have a backlight is called a backlit display. It was first in the second revision of the Gameboy Advance SP, released 2005, that Nintendo introduced backlit displays to their handheld consoles. The GBA, just as it's predecessor, lacks this feature. This means that you are unable to play games on the GBA without a light source pointed directly to the screen, as the screen is simply too dark.

Thankfully, hardware modifications to introduce backlit displays to the GBA have existed for a long time. I ordered an IPS V2 Backlight LCD Display Kit from eBay with touch controls for brightness and color mode.

| ![](/assets/media/gameboy-advance/ips_kit.jpg) |
| :---: |
| *Description* |

As the backlit display is slightly larger than the original display, I had to do some modifications to the shell to accomondate it. Following a [guide](https://wiki.handheldlegend.com/oem-and-non-ips-gba-shells-trim-guide), some of the inner plastic protrusions were trimmed down using a flush wire cutter. The plastic spacers included with the kit was supposed to be placed in the bottom and left part of the display area, I could however not use the left one due to space limitation and instead applied two layers of double-sided tape with the protective film still attached.

| ![](/assets/media/gameboy-advance/front_uncut.png) |
| :---: |
| *Description* |

With the shell ready it was time to install the new display assembly. First, an insulating film was placed on the backside of the display in order to prevent shorts with the control board. The backside of the control board was adhered to the backside of the display with the help of double-sided tape. The control board could then be connected to the display with a button-style connector. The included 40-pin ribbon cable was inserted into the control board and some additional double-sided tape was used to relieve some stress on the adapter. The protective film covering the front of the display was removed. The original adhesive strip was in good condition and was re-applied before installing the newly assembled display.

| ![](/assets/media/gameboy-advance/ips_assembled.jpg) |
| :---: |
| *Description* |

This particular kit come with touch-controlled brightness and color, wires are soldered to the control board on one side and copper tape is placed on the other. Our kit came with wires already soldered and the copper tape pre-applied, all that was left was to remove the protective film on the copper tape and adhere the ends to the shell. Neither the included adhesive nor the new glass screen was used as it would have been a waste on the already damaged shell. Instead, these were saved for a future shell replacement.

| ![](/assets/media/gameboy-advance/ips_on.jpg) |
| :---: |
| *Description* |

## Dealing with noisy audio

The GBA was notorious for its noisy audio, especially when using the 3.5 mm headphone jack. A Wiki entry on [RetroSix](https://www.retrosix.wiki/dehum-dehiss-removing-noise-from-gba-audio) identifies six sources of noise:

1.  Dirt and grime in the volume wheel. Can be mitigated by cleaning the wheel.
2.  Dirt and grime in the power switch. Can be mitigated by cleaning the internals of the switch.
3.  Insufficient bypass capacitors for the CPU and SRAM, manifest as a loud hiss. Can be mitigated with additional capacitors.
4.  Noisy power regulator circuit, manifest as a low hum. Can be mitigated with additional capacitors.
5.  Over current noise when the power regulator cannot supply the necessary current, manifest as both hum and hiss. Can be mitigated with additional capacitors.
6.  White noise caused by the PWM switching of the CPU audio out pins, manifests as low and consistent background noise.

As I found the headphone noise fatiguing, I decided on trying to mitigate it as best as I could. I found that buying capacitors of each type described in the Wiki would end up an expensive affair, as minimum order size starts at around 60 units per type. I instead opted for a [Dehum Dehiss kit](https://retrosix.co.uk/Wire-Free-Dehum-Dehiss-Kit-Game-Boy-Advance-p341648607), which is a collection of capacitors pre-assembled on a pad.

With the kit in my possession and the soldering iron warm I went to work. I first cleaned the volume wheel by dripping a small amount isopropanyl alcohol on the wheel and turning the wheel several times before cleaning the area with a cotton swab. I then de-soldered the right side of the power switch and bent the metal roof out of the way, removed the plastic switch and cleaned the metal contact pads with more isopropanyl alcohol. I then bent the metal roof back and, while holding it down, applied new solder to the right side to re-seal the housing.

| ![](/assets/media/gameboy-advance/power_switch_opened.jpg) | ![](/assets/media/gameboy-advance/power_switch_cleaned.jpg) |
| :---: | :---: |
| *Description* | *Description* |

## Making Mistakes

On to the capacitor kit, I pre-tinned the 5 pads on the kit and the 5 contact points on the motherboard. However, due to using an excessively high temperature of 425°C I managed to burn away the flux in the process, this resulted in weak solder joints on all pads and I was unable to join the kit and motherboard together.

| ![](/assets/media/gameboy-advance/audio_kit.jpg) | ![](/assets/media/gameboy-advance/audio_placement.png) |
| :---: | :---: |
| *Description* | *Description* |

Fast forward a couple of days later, I made a new attempt equipped with a tub of flux and thinner solder wire. I started by desoldering the weak joints using flux and copper wick, I then scrubbed the pads with isopropanyl alcohol to remove any residues. I then reapplied solder to the kit pads with the help of some flux. Moving on to the pads on the motherboard, all went well up until I reached the 3mm capacitor labeled "C26". Despite being able to dial the temperature down to 350°C thanks to the slimmer wire, I let the iron make contact with the capacitor for too long. As a result melting both solder joints of the capactor and releasing it from the board.

| ![](/assets/media/gameboy-advance/c26_massacred.png) |
| :---: |
| *Description* |

How bad is the lack of C26? I'm not an electrical engineer, but from a quick look at the [schematics](https://www.retrosix.wiki/schematics-game-boy-advance) we learn that C26 acts as a decoupling/bypass capacitor for the SRAM module, which helps keep the voltage coming from the power rail (VDD3) stable while also removing some AC noise. The removal of the capacitor is in other words pretty bad, but not necessary a catastrophe as its removal does not create a break in the connection between the module and power rail.

| ![](/assets/media/gameboy-advance/c26_schematic.png) |
| :---: |
| *Schematic view of C26 and SRAM* |

I made several attempts to solder C26 back in place, but the miniscule contact pads on the board made applying solder an exercise in frustration. In the end I managed to place the C26 back on it's pads only to have one side of the capacitor lift up from the board when joining it to the kit. Tired of the ordeal I decided to to see whether it would work "as-is". I re-assembled the console and found to my great relief that it would indeed power on and that functionality was not affected.

| ![](/assets/media/gameboy-advance/c26_failed.png) | ![](/assets/media/gameboy-advance/audio_assembled.jpg) |
| :---: | :---: |
| *Description* | *Description* |

Does it sound better? I recorded audio samples before and after cleaning as well as after applying the capacitor kit but did not notice any meaningful difference between them. However, the headphone experience is greatly improved as much of the "harshness" of the audio disappeared. The low humm is still present and I would imagine that my insufficent application of the capacitor kit is the reason why. I would advice anyone thinking about doing this modification to use a small piece of kapton tape or heat-resistant adhesive to hold the C26 in place while applying solder.

## Batteries and Battery life

I remember more than once, as a child, seeing that green light switch red on my Game Boy Color and having to scramble for new batteries so I could continue playing. The extensive use of disposable AA batteries were far from sustainable and this time around I decided to get rechargable. The batteries I bought was a pair of IKEA LADDA 2450mAh batteries of nickel–metal hydride (NiMh) type, they come in cheap at around 2.5 EUR each and have a surprisingly large capacity for their price.

While providing a lower voltage compared to traditional alkaline batteries (1.2V vs 1.5V), NiMh batteries are able to keep their voltage stable up until nearly being drained. This stability is important as during high current draws, alkaline batteries [struggle](https://en.wikipedia.org/wiki/Alkaline_battery#Capacity) to keep their rated capacity while NiMh remain largely unaffected. The reduced voltage output of NiMh does not prove an issue for the GBA as it has an operating voltage between 1.7 to 3.7V, where a pair of NiMh batteries are able to provide 2.4V in total. One drawback is that the red battery LED activates below 2.3V, which means that any voltage loss in the circuit can easily trigger it.

There have been extensive battery test done on the GBA and whether certain hardware modifications have an impact on battery life. From these test, it appears that a GBA with a backlit display, audio circuit modification and an ODE should be drawing between 235 - 275mA. As the batteries inside the GBA are wired in series their capacity isn't added, this would mean that we should be expecting between 9 to 10 hours of battery life out of our 2450mAh batteries.

With the promise of 9 to 10 hours of battery life, you could imagine my surprise when the console shut off after a little over 3 hours of use. Clearly something was amiss, but what? Did I get a bad battery batch? Had I blown a fuse? Was C26 coming back to haunt me? In an effort to isolate the issue I first constructed an experiment using [Mill's Method of Difference](https://en.wikipedia.org/wiki/Mill%27s_Methods#Method_of_difference), I decided on a standard setup and would then change one factor at a time and records it's impact on battery life.

The standard setup was to use a pair of IKEA LADDA and let the console run the main menu loop of the GBA version of *Harry Potter and the Philosopher's Stone*, using the ODE, until it turned itself off. This loop have many moving sprites such as rolling clouds and lightning bolts, hopefully keeping the CPU busy. In addition, the brightness was set to max (9 out of 9), the color mode to "Normal", audio was completely turned off using the volume wheel. The ODE is a revision B and had the EzFlash kernel version 1.03 and firmware version 6.0 loaded during testing.

<video
    height="400"
    controls
    autoplay
    preload="auto">
    <source src="/assets/media/gameboy-advance/sprites.webm" type="video/webm" />
</video>

Do note that the tests are an idealization, current draw will be slightly higher in reality due to player input (i.e. pressing buttons).

| ![](/assets/media/gameboy-advance/battery_histogram.png) |
| :---: |
| *Histogram of battery tests* |

## Touch Ups

Issues: power LED flickers a bit (when power switch is touched?). Some humm is back in the headphones, but no audible hiss.

Opened it up again, removed the audio kit alltogether and re-seated C26. Cleaned the area.
To fix battery LED flickering, I opened the power switch again and cleaned it throughly. Bent the roof to add more tension on the switch.
Switch roof snapped at the left joint due to me bending it too much, was able to fix it with a bit of solder.
Cleaned the volume wheel.

Switched to the new case, the feel isnt as premium as the original case but its quite alright.
One of the new included screws threaded themselves, had to use one of the old ones.
Added a new sticker.
New glass screen is great.

| ![](/assets/media/gameboy-advance/new_shell_kit.jpg) |
| :---: |
| *Shell kit* |

| ![](/assets/media/gameboy-advance/front_clean.jpg) | ![](/assets/media/gameboy-advance/back_clean.jpg) |
| :---: | :---: |
| *Before, front* | *before, back* |

| ![](/assets/media/gameboy-advance/front_new_on.jpg) | ![](/assets/media/gameboy-advance/back_new.jpg) |
| :---: | :---: |
| *After, front* | *After, back* |

<video
    height="800"
    controls
    autoplay
    preload="auto">
    <source src="/assets/media/gameboy-advance/final_result.webm" type="video/webm" />
</video>

## The price of nostalgia

Including many hours of research and tinkering.

| Item | Price (SEK) | Comment |
| --- | --- | --- |
| [IKEA LADDA 2450 mAh](https://www.ikea.com/se/sv/p/ladda-laddningsbart-batteri-hr06-aa-1-2v-50504692/) | 99 |  |
| [Backlight display kit with touch](https://www.ebay.com/itm/155105948016) | 525 | Bought from Ebay. |
| [Dehumm and dehiss kit](https://retrosix.co.uk/Wire-Free-Dehum-Dehiss-Kit-Game-Boy-Advance-p341648607), [Protective hard case](https://retrosix.co.uk/Protective-Hard-Case-for-Game-Boy-Color-Advance-Pocket-p141361048) and a new [shell sticker](https://retrosix.co.uk/Game-Boy-Advance-Shell-Sticker-p190807665) | 448 | Bought from RetroSix. |
| [Replacement shell, black](https://www.ebay.com/itm/155075530620?var=455251315425) | 178 | Bought from Ebay. |
| [EzFlash Omega Definitive Edition](https://www.ezflash.cn/product/ez-flash-omega-definitive-edition/) | 1088 | Bought from SenkoGames, included a 16GB MicroSD card with adapter. |
| Total | 2239 | Just about [200 EUR](https://www.xe.com/currencyconverter/convert/?Amount=2239&From=SEK&To=EUR), including shipping and VAT. |

| ![](/assets/media/gameboy-advance/front_new_game.jpg) |
| :---: |
| *Description* |