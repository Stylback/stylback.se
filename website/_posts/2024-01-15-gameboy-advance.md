---
title: "Bringing a Game Boy Advance into the 2020s"
categories: repair
updated: 2024-03-21
layout: post
---

As a child growing up in the early 2000s, I have fond memories of playing *Pokémon Yellow* and *Harry Potter and the Philosopher's Stone* on my [Game Boy Color](https://en.wikipedia.org/wiki/Game_Boy_Color). Over time, nostalgia have carved out a soft spot for the Game Boy consoles. I've more than once considered taking the dive back in, so you can imagine my joy when I was offered a [Game Boy Advance](https://en.wikipedia.org/wiki/Game_Boy_Advance) (GBA) in need of maintenance, free of charge. It had come as a hand-me-down from a family friend around 2010 and, due to a lack of game cartridges, successively been left in a drawer until it was graciously given to me.

The years had not been kind to it, there were multiple scratches on both case and screen as well as an accumulation of dust and grime. Originally white, the case had yellowed due to [degradation](https://en.wikipedia.org/wiki/Photo-oxidation_of_polymers) of the ABS plastic, not at all unexpected from a console over 20 years old. The original battery lid had been replaced with a black spare which, while functional, was quite an eye-sore when combined with the yellowed case. In addition, there was a pair of AA alkaline batteries still in the battery compartment which had expired in 2009, producing green-white residue as a result of leakage.

| ![](/assets/media/gameboy-advance/front_dirty.jpg) | ![](/assets/media/gameboy-advance/wikimedia_gameboy.jpg) |
| :---: | :---: |
| *Front shot of the GBA, the ABS plastic is visibly yellowed and there are multiple scratches.* | *Original artic-white color of the GBA. Source: [Wikimedia](https://commons.wikimedia.org/wiki/File:Wikipedia_gameboyadvance.jpg). Copyright: Public Domain.* |

The model number on the back (`AC19789877`) told me it was manufactured for the European market. Opening the battery lid, the silkscreen visible through a small slit (`02 8-1`) told me the motherboard was a 40-pin model (as opposed to 32-pin).

| ![](/assets/media/gameboy-advance/motherboard_model.jpg) |
| :---: |
| *Macro shot of the backside, the GBA model number is barely visable. A silkscreen is visible through a slit in the battery compartment, a leading 0 indicates it's a 40-pin motherboard model.* |

## Does it Turn On?
Before I could test whether the console was still operational I had to clean the battery compartment. There is a metallic protrusion in the middle of the left battery terminal which pushes up against the plastic housing, to remove the terminal I had to wedge a flathead screwdriver between the protrusion and the plastic wall while pulling upwards with a tweezer.

| ![](/assets/media/gameboy-advance/back_dirty.jpg) |
| :---: |
| *Battery compartment with residue, the left metal terminal removed.* |

With the terminal out, the compartment could be cleaned with relative ease. As the residuals came from alkaline batteries (basic on the pH scale), it was best removed with a mild acid. I opted for food-grade citric acid (E330) diluted in warm water, I then dipped a soft toothbrush in the solution and scrubbed both the battery terminal and the internals of the compartement. Care had to be taken not to let the solution drip through to the motherboard, potentially damaging it. The reaction between the residual and the solution produced fizzling foam, when the reaction had stopped I dried the compartement with a cloth and left to dry. An hour later, fresh batteries were inserted, the console turned on and I was greeted with the nostalgic Game Boy logo and chime.

<video
    width="100%"
    controls
    preload="auto">
    <source src="/assets/media/gameboy-advance/gameboy_chime.webm" type="video/webm" />
</video>

## Disassembly
Relieved that the console was in a working condition, I continued with a complete disassembly. The top and bottom halves of the case were held together by six tri-point screws (size Y2.0) accessible from the outside and one Philips screw (size 0) accessible through the battery compartement. After seperating these two halves I was met by the backside of the motherboard. A timestamp on the upper left (2001) indicated that the unit was manufactured week 20 of 2001 (May 13th - 19th). Considering the official European release of the GBA on June 22, 2001, it would be fair to assume that this unit was amongst the first to hit the European market.

| ![](/assets/media/gameboy-advance/back_screws.png) |
| :---: |
| *Back shot, red circles highlight the six tri-point screws and the one Philips screw.* |

Found on the top of the motherboard, the ribbon display cable had to be disconnected from its adapter by pushing the two locks out on either side of it. Great care had be taken as the locks are fragile and not easily replacable. I used the flat end of a plastic spudger, working close to the board to reduce the likelihood of slipping. With the locks fully extended, the ribbon cable could be gently pulled out from the adapter. Moving on, three additional Philips screws (size 0) could be found holding the motherboard to the front-half of the case. These had to be removed to access the display assembly.

| ![](/assets/media/gameboy-advance/internal_screws.png){: width="600" } |
| :---: |
| *Internal shot of the two case halves. On the top, four Philips screws are found while at the bottom another three. All screws are highlighted in red.* |

The motherboard could now be separated from the front along with buttons and sideclips, the display assembly could be removed from the front case using some gentle prying. Here I did not pay enough attention to the required force and accidentaly ripped the isolating foam on the back of the assembly.

| ![](/assets/media/gameboy-advance/disassembly_half.jpg){: width="600" } |
| :---: |
| *From the top: back-half of the case, front-half of the case with display assemply and buttons, motherboard.* |

Returning to the back half of the case, a long metal bracket was held in place using four Philips screws (size 0 head). Removing the battery terminal was a breeze from this side. One final step to the disassembly was to pull out the small metal clips inbedded in the shoulder buttons.

| ![](/assets/media/gameboy-advance/disassembly_full.jpg) |
| :---: |
| *Full disassembly of the GBA, excluding soldered-on components.* |

With the console disassembled it was time to clean the parts. The motherboard, screws and loose metal pieces were cleaned using cotton swabs dipped in 98% isopropyl alcohol (IPA). The case, buttons and the soft silicon pads were scrubbed in soapy water using a soft toothbrush. After the parts had been throughly dried, the console was reassembled.

## The Game Situation

| ![](/assets/media/gameboy-advance/hp_cartridge.jpg){: width="400" } |
| :---: |
| *An original Harry Potter and the Champer of Secrets GBA game cartridge.* |

To test that everything from speakers to buttons worked as intended, I bought an original *Harry Potter and the Champer of Secrets* game cartridge second hand. At 200 SEK (~18 EUR) it was a good deal to test functionality, but it's worth taking a detour to discuss the state of GBA games in the 2020s.

The last game to be released for the GBA was in 2008, Nintendo successively ceased production of the console at the end of 2009. As such, no new game cartridges have been manufactured and sold for the GBA for over a decade. As a result, if you're looking to play one of your childhood favourites you are presented with four options:

1.  You can buy an authentic game cartridge second hand.
2.  You can buy a bootleg copy of the game on eBay or similar.
3.  You can buy a so-called flash cartridge and play any game you want.
4.  You can forget about the console altogether play any game you want through an emulator on your phone or computer.

If it wasn't the case that most original game cartridges are prohibitively expensive on the second hand market, I would've opted for the first option for the "authetic" experience. However, as cartridges for games such as *Pokémon Emerald* and *The Legend of Zelda: A Link to the Past* starts at around 150 EUR, I took the more *pragmatic* third option and bought a flash cartridge.

There are many flash cartridges to chose from, I ordered the [EZ-FLASH OMEGA Definitive Edition](https://www.ezflash.cn/product/ez-flash-omega-definitive-edition/) (ODE) as it was both more affordable came with more features compared to other premium options such as the [Everdrive Mini](https://krikzz.com/our-products/cartridges/everdrive-gba-mini.html). Among the more notable features of the ODE is on-board emulation to run Game Boy, Game Boy Color and NES games. The ODE also features ferroelectric RAM which does not depend on an internal battery to store save data.

As with most flash cartridges, you download game files (ROMs) from online archives such as [Vimm's Lair](https://vimm.net/) or the [Internet Archive](https://archive.org/), you then transfer these files over to the cartridge using an adapter or SD card. On the ODE, this transfer is facilitated through a MicroSD card, which can be any size between 4GB to 128GB. The MicroSD card needs to be prepared correctly per [EZ-FLASHs instructions](https://www.ezflash.cn/omegade-en.pdf) prior to inserting it into the ODE.

My ODE came with a 16GB MicroSD card included. It had already been prepared beforehand by the reseller, however I was met with read/write issues when trying to transfer ROMs and decided to format it manually instead. After formatting it as FAT32, I downloaded the necessary files from the [EZ-FLASH download page](https://www.ezflash.cn/download/), transfered them over together with some ROMs and a firmware update before inserting it into the ODE.

| ![](/assets/media/gameboy-advance/ode_kit.jpg){: width="400" } |
| :---: |
| *The EZ-FLASH OMEGA Definitive Edition package with the included MicroSD card.* |

With regards to GBA games, the ODE plays them flawlessly. I did however notice some visual artifacts while playing the Game Boy Color version of *Harry Potter and the Philosopher's Stone*. After doing some research, the artifcats seems to be the result of a limitation of the [Goomba Color emulator](https://www.dwedit.org/gba/goombacolor.php) used in the ODE, which is that some color palettes are not correctly emulated. Some enthusiasts suggest that these artifacts are fixable by flashing custom firmware on the ODE, which in turn would enable the use of a different Game Boy Color emulator. While interesting, the artifacts are not such a big deal that I would want to risk bricking my 100 EUR flash cartridge. Perhaps a project for another time.

| ![](/assets/media/gameboy-advance/gbc_artifact_1.jpg) | ![](/assets/media/gameboy-advance/gbc_artifact_2.jpg) |
| :---: | :---: |
| *The main menu of the Game Boy color version of Harry Potter and the Philosopher's Stone. Notice the white-red visual artifacts in the bottom edge of the image.* | *Another artifact, notice the color bands in the dialogue window.* |

## Backlight
A modern LCD display, such as the one in a smartphone, have a layer of white LEDs that shine light up through the rest of the screen layers. This layer is called a backlight, a display that have a backlight is called a backlit display.

It was first in the second revision of the Game Boy Advance SP, released 2005, that Nintendo introduced backlit displays to their handheld consoles. The GBA, just as it's predecessor, lacks this feature. Without a light-source shining directly on the screen (or sufficient ambient light in the room), you are simply unable to see what's going on which would (if you ask my childhood self) become a great source of frustration.

Thankfully, hardware modifications to introduce backlit displays to the GBA have existed for a long time. I ordered an *IPS V2 Backlight LCD Display Kit* from eBay, which also came with built-in touch controls for brightness and color mode.

As the backlit display is slightly larger than the original display, I had to do some modifications to the shell to accomondate it. Following a [guide](https://wiki.handheldlegend.com/oem-and-non-ips-gba-shells-trim-guide), some of the inner plastic protrusions were trimmed down using a flush wire cutter. The plastic spacers included with the kit was supposed to be placed in the bottom and left part of the display area, I could however not use the them due to space limitation and instead applied two layers of double-sided tape to pad the area.

| ![](/assets/media/gameboy-advance/front_uncut.png) |
| :---: |
| *The front-half of the case, parts that have to be trimmed in order to accomondate an IPS kit is highlighted in red.* |

With the shell ready it was time to install the new display assembly. First, an insulating film was placed on the backside of the display in order to prevent shorts with the control board. The backside of the control board was adhered to the backside of the display with the help of double-sided tape. The control board could then be connected to the display with a button-style connector. The included 40-pin ribbon cable was inserted into the control board and some additional double-sided tape was used to relieve some stress on the adapter. The protective film covering the front of the display was removed. The original adhesive strip was in good condition and was re-applied before installing the newly assembled display.

| ![](/assets/media/gameboy-advance/ips_kit.jpg){: width="400" } |
| :---: |
| *The assembled IPS display kit.* |

As mentioned earlier, this particular kit came with touch-controlled brightness and color mode. Wires are attached to the shell using copper tape, which sends a signal to the control board when "touched". Our kit came with wires already soldered and the copper tape pre-applied, all that was left was to remove the protective film on the copper tape and adhere the ends to the shell.

| ![](/assets/media/gameboy-advance/ips_assembled.jpg) |
| :---: |
| *Fully assembled IPS display adhered to the front case, the copper wires are placed in the top and bottom of the case.* |

Neither the included adhesive nor the new glass screen was used as it would have been a waste on the already damaged shell. Instead, these were saved for a future shell replacement.

| ![](/assets/media/gameboy-advance/ips_on.jpg){: width="400" } |
| :---: |
| *The new IPS display on full brightness. Notice that the image is easily viewed thanks to the backlight.* |

## Dealing with Noisy Audio
The GBA was notorious for its noisy audio, especially when using the 3.5 mm headphone jack. I prefer to play with headphones on, but the audible hiss from the GBAs headphone jack quickly became fatiguing. I decided to try to mitigate it as best as I could and did some research. A Wiki entry on [RetroSix](https://www.retrosix.wiki/dehum-dehiss-removing-noise-from-gba-audio) identified six sources of noise:

1.  Dirt and grime in the volume wheel. Can be mitigated by cleaning the wheel.
2.  Dirt and grime in the power switch. Can be mitigated by cleaning the internals of the switch.
3.  Insufficient bypass capacitors for the CPU and SRAM, manifest as a loud hiss. Can be mitigated with additional capacitors.
4.  Noisy power regulator circuit, manifest as a low hum. Can be mitigated with additional capacitors.
5.  Over-current noise when the power regulator cannot supply the necessary current, manifest as both hum and hiss. Can be mitigated with additional capacitors.
6.  White noise caused by the PWM switching of the CPU audio out pins, manifests as low and consistent background noise.

I found that buying capacitors of each type described in the Wiki would end up an expensive affair, as minimum order sizes started at around 60 units per type on most marketplaces with an additional charge per roll. Instead, I opted for a [Dehum Dehiss kit](https://retrosix.co.uk/Wire-Free-Dehum-Dehiss-Kit-Game-Boy-Advance-p341648607), which is a collection of the necessary capacitors pre-assembled on a pad.

With the kit in my possession and the soldering iron hot I went to work. I first cleaned the volume wheel by dripping a small amount IPA on the wheel and turning the wheel several times before cleaning the area with a cotton swab. I then de-soldered the right side of the power switch and bent the metal roof out of the way, removing the plastic switch and cleaning the metal contact pads with more IPA. When done, I bent the metal roof back and applied new solder to the right side while holding the roof down to re-seal the housing.

| ![](/assets/media/gameboy-advance/power_switch_opened.jpg) | ![](/assets/media/gameboy-advance/power_switch_cleaned.jpg) |
| :---: | :---: |
| *Macro-shot of the power switch. The metal roof is bent out of the way to access the internals.* | *Macro-shot of the power switch. The plastic switch removed and the metal pad underneath cleaned.* |

## Making Mistakes
On to the capacitor kit, I pre-tinned the 5 pads and the 5 contact points on the motherboard. However, due to using an excessively high temperature of 425°C I managed to burn away the flux in the process which resulted in weak solder joints. As such, I was unable to join the kit and motherboard contact points together.

| ![](/assets/media/gameboy-advance/audio_kit.jpg) | ![](/assets/media/gameboy-advance/audio_placement.png) |
| :---: | :---: |
| *The RetroSix Dehum Dehiss capacitor kit. The contact pads have been tinned.* | *Correct placement of the capacitor kit in red with blue points indicating motherboard contact points.* |

Fast forward a couple of days later, I made a new attempt equipped with a tub of flux and a thinner solder wire. I started off by removing the previous weak joints, I then scrubbed the pads with IPA to remove any residues. When clean, I reapplied solder to the kit with the help of some flux.

Moving on to the motherboard contact points, all went well up until I reached the 3 mm capacitor labeled "C26". Despite being able to dial the temperature down to 350°C thanks to the slimmer wire, I let the iron make contact with the capacitor for too long. As a result melting both solder joints of the capactor and releasing it from the board.

| ![](/assets/media/gameboy-advance/c26_massacred.png) |
| :---: |
| *Macro-shot of the 3 mm C26 capacitor which have been released from the board.* |

How bad is the lack of C26? I'm not an electrical engineer, but from a quick look at the [schematics](https://www.retrosix.wiki/schematics-game-boy-advance) we learn that C26 acts as a decoupling/bypass capacitor for the SRAM module, which helps keep the voltage coming from the power rail (VDD3) stable while also removing some AC noise. The removal of the capacitor was in other words pretty bad, but not necessary a catastrophe as its removal does not create a break in the connection between the module and power rail.

| ![](/assets/media/gameboy-advance/c26_schematic.png) |
| :---: |
| *A simplified schematic view of the relationship between C26, SRAM and voltage rails.* |

I made several attempts to solder C26 back in place, but the miniscule contact pads on the board made applying solder to it an exercise in frustration. In the end I managed to place the C26 back on its pads only to have one side of the capacitor lift up from the board when joining it to the kit. Tired of the ordeal I decided to to see whether it would work "as-is". I re-assembled the console and found to my great relief that it would indeed power on and that functionality was not noticable affected.

| ![](/assets/media/gameboy-advance/c26_failed.png) | ![](/assets/media/gameboy-advance/audio_assembled.jpg) |
| :---: | :---: |
| *Macro-shot of C26 being lifted up from the board.* | *Assembled capacitor kit.* |

Does it sound better? I recorded audio samples before and after cleaning the switch/wheel (but did not keep them for posterity), as well as after applying the capacitor kit, but did not notice any meaningful difference between them. However, the headphone experience was greatly improved as much of the "harshness" of the audio had disappeared. The low humm was still present and I would imagine that my insufficent application of the capacitor kit was the reason why. I would advice anyone thinking about doing this modification to use a small piece of kapton tape or heat-resistant adhesive to hold C26 in place while applying solder.

## Batteries and Battery Life
I remember more than once as a child seeing that green LED switch red on my Game Boy Color and having to scramble for new batteries so I could continue playing. The extensive use of disposable AA batteries were far from sustainable and this time around I decided to go rechargable. The batteries I bought was a pair of IKEA LADDA 2450 mAh batteries of nickel–metal hydride (NiMh) type, they came in pretty affordable at around 2.5 EUR each and exhibits a surprisingly large capacity for their price.

While providing lower voltage compared to traditional alkaline batteries (1.2 V vs 1.5 V), NiMh batteries are able to keep their voltage stable up until nearly being drained. This stability is important as, during high current draws, alkaline batteries [struggle](https://en.wikipedia.org/wiki/Alkaline_battery#Capacity) to keep their rated capacity while NiMh remain largely unaffected. The reduced voltage output of NiMh does not prove an issue for the GBA as it has an operating voltage between 1.7 to 3.7 V, where a pair of NiMh batteries are able to provide 2.4 V in total. One drawback is that the red battery LED activates below 2.3 V, which means that any voltage loss in the circuit can easily trigger it.

There have been extensive battery test done on the GBA and whether certain hardware modifications have an impact on battery life. From these test, it appears that a GBA with a backlit display, audio circuit modification and an ODE flash cartridge should draw between 235 - 275 mA. As the batteries inside the GBA are wired in series their capacities aren't added, this means that we should expect between 9 to 10 hours of battery life out of our 2450 mAh batteries.

With the promise of 9 to 10 hours of battery life, you could imagine my surprise when the console shut off after a little over 3 hours of use. Clearly something was amiss, but what? Did I get a bad battery batch? Had I blown a fuse? Was C26 coming back to haunt me? In an effort to isolate the issue I constructed a test using [Mill's Method of Difference](https://en.wikipedia.org/wiki/Mill%27s_Methods#Method_of_difference). That is, I decided on a standard setup and then changed one factor at a time, recording it's impact on the test results.

The standard setup was to go back to basic: old screen, original cartridge, no capacitor kit, sound wheel at lowest. The console would run the main menu loop of *Harry Potter and the Philosopher's Stone* until it turned itself off. This loop have many moving sprites such as rolling clouds and lightning bolts, hopefully keeping the CPU busy. Do note that the measurements are a form of idealization, current draw will be slightly higher during real usage due to player input (i.e. pressing buttons).

<video
    width="80%"
    controls
    loop
    preload="auto">
    <source src="/assets/media/gameboy-advance/sprites.webm" type="video/webm" />
</video>

The standard setup (or "baseline") is what one would expect from an original, unmodified GBA. When audio was turned off in "software", I mean that it was turned off in the main menu. For tests using the ODE, I will note that it's a revision B, had the EzFlash kernel version 1.03 and firmware version 6.0 during testing. For tests using the new IPS display, I will note that the color mode was set to "Normal", lowest brightness set to 1 out of 9 and maximum to 9 out of 9.

| ![](/assets/media/gameboy-advance/battery_histogram.png) |
| :---: |
| *Histogram of six battery tests. The top figure indicates the time the GBA was able to run the main menu loop until shutting down for each test. The bottom figure indicates the approximate current draw of the whole system.* |

From the histogram we learn that the ODE adds 148 mA to the systems current draw while the IPS adds between 106 to 215 mA. The combination of IPS and ODE adds 370 mA to the systems current draw on maximum brightness. Why this number is so much higher than other battery test may be due to an inefficient IPS display assembly or power regulator. While high, the current draw seems like the price to pay for a backlit display and a flash cartridge.

For the sake of transparency I will mention that I made significantly more tests than what is on display in the histogram (11 more, in fact). These tests were omitted because I did not properly control for background variables or I failed to correctly measure battery life. Some tests that were omitted was the impact of the capacitor kit on battery life and the impact on using headphones or not (for the curious, it appeared that they had no impact on battery life but I cannot conclusivly say). I did not repeat these tests due to the signficiant time investment it would require to repeat them (atleast one day of supervision per test).

## Touch-Ups
The power LED exhibited some flickering during use, most apparent when touching the power switch. I recognized this as a lack of tension in the power switch housing which presses down on the power button. I opened the console up again, cleaned the power switch throughly and bent the metal bracket inwards to increase the tension on the plastic button. In this process I accidentally snapped the metal bracket, but was able to repair it using some solder.

While partly disassembled, I took the opportunity to remove the capacitor kit altogheter as I did not feel comfortable knowing that the C26 capacitor was not correctly set. With the kit removed, a steady hand and plenty of patience, I was able to place the C26 back in its original place.

As final touch-up I bought a new shell kit in black, which included a new front glass panel, sticker, buttons and screws. Assembly came without issues with the exception of one of the internal screws immediately threading. I also added a lanyard.

| ![](/assets/media/gameboy-advance/front_clean.jpg) | ![](/assets/media/gameboy-advance/back_clean.jpg) |
| :---: | :---: |
| *Old case, front.* | *Old case, back.* |

| ![](/assets/media/gameboy-advance/front_new_on.jpg) | ![](/assets/media/gameboy-advance/back_new.jpg) |
| :---: | :---: |
| *New case, front (no lanyard).* | *New case, back (no lanyard).* |

## Result
After more than two months of research, tinkering and package-waiting, I managed to modify this GBA into a modern gaming experience. Hunkering under a lamp like I did as a child is no longer necessary thanks to the IPS display and I get to enjoy all my childhood classics thanks to the ODE.

But just as nothing is perfect, neither is this. As I removed the capacitor kit the audio hiss is back in the headphone jack, prompting me to simply play on low volume without headphones. The new shell does not have the same premium feel as the original, but it's free from scratches and yellowing. Enjoying a modern gaming experience comes at the cost of battery life and I always keep a spare pair in the carrying case, getting 5 hours of game time pretty consistently before having to swap for a fresh pair.

<video
    width="100%"
    controls
    preload="auto">
    <source src="/assets/media/gameboy-advance/final_result.webm" type="video/webm" />
</video>

## The Price of Nostalgia

| ![](/assets/media/gameboy-advance/front_new_game.jpg){: width="400" } |
| :---: |
| *How much did this thing cost?* |

Without counting the many hours of reasearch and tinkering, the monetary cost of the transformation comes out at 2328 SEK. In addition, I've bought a number of original game cartridges second hand for 786 SEK, bringing the total cost of the project to 3114 SEK as of writing. A detailed cost breakdown is included in the table below.

| Item | Price (SEK) | Comment |
| --- | --- | --- |
| IKEA LADDA 2450 mAh | 99 | [Link](https://www.ikea.com/se/sv/p/ladda-laddningsbart-batteri-hr06-aa-1-2v-50504692/)  |
| Backlight display kit with touch | 525 | [Link](https://www.ebay.com/itm/155105948016) |
| Dehumm and dehiss kit, Protective hard case and shell sticker | 448 | All from RetroSix. [Link 1](https://retrosix.co.uk/Wire-Free-Dehum-Dehiss-Kit-Game-Boy-Advance-p341648607), [Link 2](https://retrosix.co.uk/Protective-Hard-Case-for-Game-Boy-Color-Advance-Pocket-p141361048), [Link 3](https://retrosix.co.uk/Game-Boy-Advance-Shell-Sticker-p190807665) |
| Replacement shell kit | 178 | [Link](https://www.ebay.com/itm/155075530620?var=455251315425) |
| EzFlash Omega Definitive Edition | 1088 | Included a 16GB MicroSD card with adapter, [Link](https://www.ezflash.cn/product/ez-flash-omega-definitive-edition/). |
| Harry Potter: Quidditch World Cup | 103 |  |
| Harry Potter and the Philosopher's stone | 184 |  |
| Harry Potter and the Chamber of Secrets | 199 |  |
| Harry Potter and the Prisoner of Azkaban | 179 |  |
| Harry Potter and the Goblet of Fire | 121 |  |
| **Total** | **3114** | Just about [278 EUR](https://www.xe.com/currencyconverter/convert/?Amount=3114&From=SEK&To=EUR). |

Now the question is, was it worth it? To me, I would say yes. Not because the gaming experience itself is worth 278 EUR (emulation is free after all), but because I enjoyed the process. Would I do it again? You should never say never, but I think I've had my fill of GBA tinkering to last a few years and will be looking forward to new projects.