---
title: "No Bloat, No Battery: Liberating an Old Android Device"
categories: repair
updated: 2024-02-28
---

| ![](/assets/media/liberating-android/original_front.jpg) | ![](/assets/media/liberating-android/final_result.jpg) |
| :---: | :---: |
| *Before* | *After* |

Do you have an old smartphone just laying in a cupboard somewhere? When you buy a new phone, chances are you might keep the old one around as a backup. When you a couple of years later buy an even newer model, the *old* new smartphone is then promoted to the role of backup. What do you do with the *old* old smartphone? Due to their age there most likely won't be a demand for them on the second-hand market and even if there were, the years of wear-and-tear might reduce their prices to the point where it's not worth the time to put them up for sale.

I recently got my hands on a couple of old Android devices, a [Samsung Galaxy W](https://en.wikipedia.org/wiki/Samsung_Galaxy_W) from 2011 and a [Samsung Galaxy Ace 4](https://en.wikipedia.org/wiki/Samsung_Galaxy_Ace_4) from 2014. The previous owner gave these to me, free of charge, as long as I made an effort to extract any remaining images still on them. I was quite happy with this arrangement, as I've been looking for an old smartphone to use in a separate project.

However, there were the usual problems one could expect from decade old smartphones:
1. Battery: The Samsung Galaxy Ace 4 had a swollen battery and the Galaxy W lacked a battery altogether.
2. Software: The Samsung Galaxy Ace 4 came with Android KitKat (4.4.2) and the Galaxy W came with Android Gingerbread (2.3).

If I was going to extract the images from them I would would have to solve the battery situation, if I was going to use these in a project I would have to solve both.

### Cutting out the Middleman

Inspecting the battery compartments gave me an idea: as these devices were designed with swappable batteries in mind, and the battery interfaces consists of exposed pads, there can't be too much going on between the terminals. Would it not be feasible to just supply the devices with power through their pads directly? This way, we could power the devices with an external power supply, solving the need for batteries forever.

An inspection of the bloated battery in the Galaxy Ace 4 tells us it's a 7.22 Wh battery with an output of 3.8 V, which works out to 1900 mAh. We also learn that it has a charging input voltage of 4.35 V. There are four pads on the battery of which two are marked as the positive and negative terminals. Further, as it's an NFC-enabled battery, we learn that one of the unmarked pads must be for NFC data transfer. This only leaves one mystery pad, which is most likely for battery health and/or temperature. Taking a look at an old [Notebookcheck review](https://www.notebookcheck.net/Samsung-Galaxy-Ace-4-SM-G357FZ-Smartphone-Review.128973.0.html) for the Galaxy Ace 4, we learn that the 1900 mAh battery would last between 3.68 to 24.2 hours depending on load, which would indicate a current draw between 78.5 to 709 mA.

| ![](/assets/media/liberating-android/battery_1.jpg) | ![](/assets/media/liberating-android/battery_2.jpg) |
| :---: | :---: |
| *Samsung Galaxy Ace 4 battery, the two battery packs can be seen bulging up against the housing.* | *Macro-shot of the battery pads, displaying polarity.* |

So we're looking at an external power source that can supply the device with a voltage of 3.8 V and a variable current up to ~710 mAh. Taking designer tolerances into account, the supplied voltage could probably be as high as 5.22 V (4.35 +20%) without damaging the internal components. These demands are well within the specs of the ubiquitous USB power brick, which most of us have several lying about at home. After diggin around in a closet I found the perfect candidate, an old OnePlus USB charger rated for 5 V, 1.1 A.

To feed the device with power from the USB charger I took apart an old 20 cm USB-A to Micro-USB cable from IKEA. I snipped away the Micro-USB end, revealing the two power (red, black) and two data (green, white) cables. Stripping a good 2 cm of sleeving from the power cables, I then soldered the red cable to the positive battery interface pin and the black cable to the negative interface battery pin. 

| ![](/assets/media/liberating-android/solder_1.jpg) | ![](/assets/media/liberating-android/solder_2.jpg) |
| :---: | :---: |
| *Back-shot displaying the preliminary USB power connection.* | *Macro-shot of the soldered connection.* |

Next, I plugged the USB-A end of the cable into the charger and held the power button. To my amazement, it turned on! Battery indicator displayed 100%, no charging icon, no error messages.

### Extracting Data via ADB

With the device up and running, we can now try and make a copy of its contents. This is best done using the [Android Developer Bridge (ADB)](https://developer.android.com/tools/adb), for which we need to enable USB-debugging on the device. This in turn requires that we can get past the lock screen, which for me was a non-issue as the previous owner remembered the combination. With the device unlocked, navigate to `Settings → About this device` and tap on `Build number` 7 times. A message will pop up saying `Developer options enabled`. Now go back to settings, navigate to `Developer options → Enable USB-debugging` and tap to enable.

As I'm on a Debian-derivative OS with the `apt` package manager, I will be using terminal commands fit for my system. If you have another OS, change your commands accordingly.

Install ADB with:

```bash
sudo apt install adb
```

Now, plug the device into a computer via USB. A notification should show up on the device asking whether the computer is trusted. Tap yes or similar to confirm, then open up a terminal and run `adb devices`:

```bash
adb devices

List of devices attached
9d5ee062	device
```

> If the list of devices are empty or the device shows up as unauthorized, you might try some troubleshooting steps at the end of this section. When the device is detected and authorized, continue as normal.

On Android, user data is stored in the `/sdcard` directory. We can copy the entire directory with this one command:

```bash
adb pull /sdcard /path-to-a-directory
```

Where `/path-to-a-directory` is a directory on your computer, such as `~/Downloads/dump`. This process might take a while, so be patient.

#### Troubleshooting an ADB connection

If it does not show up at all (as in, the list is empty), switch to another cable or try another USB port.
If it shows up as `unauthorized` it means that the device does not trust the computer, in which case you will have to:
1. Unplug the device
2. Tap `Revoke USB debugging authorization`
3. Disable, then re-enable `USB-debugging`
4. Remove your `~/.android` folder
5. Re-insert the USB cable
6. Run `the command` again.

If the device is still listed as `unauthorized`, you could manually add your `adbkey.pub` to the device when the device is in recovery mode. First, generate a public ADB key from your private ADB key:

```bash
adb pubkey ~/.android/adbkey > ~/.android/adbkey.pub
```

Where `~/.android/adbkey` is the private key created by ADB, which by default is placed in your home directory. Turn the device off and boot it into recovery mode by holding `Home + Power + Volume Up` at the same time. Connect it to your computer via cable, open up a terminal and run:

```bash
adb devices
List of devices attached
9d5ee062	recovery
```

If it shows up as `recovery` you're good, push the key onto the device:

```bash
adb push ~/.android/adbkey.pub /data/misc/adb/adb_keys
```

Reboot the device, it should now accept your computer as an authorized device.

### Custom Software

Samsung have the tendency to add bloat, such as pre-installed apps that cannot be removed, to an otherwise functioning Android experience. Back around 2010-2015, you solved this by flashing a custom ROM (third part operating system) such as [CyanogenMod](https://en.wikipedia.org/wiki/CyanogenMod) or [Paranoid Android](https://en.wikipedia.org/wiki/Paranoid_Android_(operating_system)), assuming there was a port for your device. To make this process easy, and to circumvent Samsungs lock-down attempts, you would use the infamous [Odin flash tool](https://en.wikipedia.org/wiki/Odin_(firmware_flashing_software)). Odin also allowed you to flash a custom recovery image such as [TWRP](https://en.wikipedia.org/wiki/TWRP_(software)) and root your device with modules like [Magisk](https://en.wikipedia.org/wiki/Magisk_(software)).

[Thor](https://github.com/Samsung-Loki/Thor) is a Odin-like flash tool for Linux, which we will use to flash a custom recovery image. This in turn will allow us to flash a custom ROM. There aren't many alternatives for the old Galaxy Ace 4, but there is both a [TWRP](https://github.com/tibixh/android_device_samsung_heatqlte) recovery image and a [BaconOS](https://xdaforums.com/t/rom-sm-g357fz-4-4-4-baconos-for-samsung-galaxy-ace-style-lte.4455325/) ROM image for the `SM-G357FZ` (which is the model version we have). To download the BaconOS image, go [here](https://www.mediafire.com/file/symc4ra53k3oane/BaconOS-heatqlte_V1.2.zip/file), to download TWRP you can run this command:

```bash
wget -q -O ~/Downloads/twrp-heatqlte.tar https://github.com/tibixh/android_device_samsung_heatqlte/releases/download/stable-twrp/twrp-heatqlte.tar
```

With the files ready, let us install Thor. Start off by installing `.NET 7`, which is a prerequisite for Thor.

```bash
sudo apt install dotnet7
```

Download [Thor](https://github.com/Samsung-Loki/Thor) and extract it in `~/thor` with this one command:

```bash
wget -q -O ~/Downloads/temp.zip https://github.com/Samsung-Loki/Thor/releases/download/1.0.4/Linux.zip && unzip ~/Downloads/temp.zip -d ~/thor && rm ~/Downloads/temp.zip
```

Now that Thor is ready, connect the device via USB and boot it into download mode using ADB:

```bash
adb reboot download
```

When the device is ready, start a Thor shell:

```bash
sudo ~/thor/TheAirBlow.Thor.Shell
```

Within the Thor shell, connect to the device using the `connect` command and press `enter` to pick your device from the list:

```bash
shell> connect
Choose a device to connect to:                              
                                                            
> GT-I9100 Phone [Galaxy S II] (Download mode) (ID 001:111) 

Successfully connected to the device!
```

Start an Odin session with `begin odin`:

```bash
shell> begin odin
Successfully began an Odin session!
```

Flash TWRP onto the device using the `flashTar` command, pick `recovery.img` from the menu using `space` and `enter`:

```bash
shell> flashTar ~/Downloads/
Choose what partitions to flash from twrp-heatqlte.tar:
                                                       
> [x] recovery.img (RECOVERY)     

You chose to flash 1 partitions in total:
recovery.img from twrp-heatqlte.tar on partition RECOVERY
Are you absolutely sure you want to flash those? [y/n] (n): y

Flashing sequence 1 / 1 onto RECOVERY ━━━━━━━━━━ 100% 29.6 MB/s 12.4 MB 00:00:00
```

**IMPORTANT**: While we can safely power off the device, Samsung's default recovery will overwrite TWRP if we let the device reboot as normal. We can boot directly to TWRP using the `reboot recovery` command, otherwise we can use `reboot normal`, pull the power cable out when the screen goes dark and boot to TWRP with `Home + Power + Volume Up`. Pick whatever you prefer, you can always re-flash if you accidentally let it boot as normal.

EIther way, when you have succesfully booted into TRWP you will have to allow modifications on the screen to keep TWRP persistent.

| ![](/assets/media/liberating-android/twrp.jpg){: width="400" } |
| :---: |
| *Screenshot of the TWRP welcome screen.* |

Now, transfer the BaconOS image over to the device using ADB:

```bash
adb push ~/Downloads/BaconOS-heatqlte_V1.2.zip /sdcard/
```

In TWRP, tap `Install` and choose the file. Follow installation instructions, wipe cache/dalvik when promped and reboot. If everything went well you should be met with the BaconOS logo.

### On the Operating table

With the power taken care of, data extracted and the custom software installed it was time to tidy things up a bit. I started by de-soldering the USB-cable from the battery interface pins and unscrewing the 11 screws (Philips #00) holding the phone in place.

| ![](/assets/media/liberating-android/screws.png){: width="400" } |
| :---: |
| *Back-shot of the device. The 11 Philips screws are highighted in red.* |

I then got a plastic pick between the front glass and the surrounding frame, which allowed me to pop the motherboard out. With the device almost fully disassembled, I cleaned both board and frame with isopropyl alcohol (IPA), taking special care to clean the headphone jack and USB port.

| ![](/assets/media/liberating-android/disassembled.jpg){: width="600" } |
| :---: |
| *Left: Motherboard with display assembly (not seen). Right: Device frame.* |

The screen was severely shattered and held together with an old TPE screen protector, a replacement screen would have cost about 50 EUR with shipping. As it's more than the device is worth I opted for trying to keep it from further damage. I removed the old screen protector, removed some of the finer glass shards with a tweezer and then cleaned the area with IPA. Next, I applied clear tape to the whole screen area vertically and cut to fit. The device was then assembled.

To use the Galaxy Ace 4 with the backside attached, I had to drill a 2 cm hole to feed the USB cable through. The power cables were then trimmed to appropriate length and re-soldered to the battery interface pins. To reduce the tension on the connection, I used to electrical tape to hold the cable down.

| ![](/assets/media/liberating-android/new_solder_1.jpg) | ![](/assets/media/liberating-android/new_solder_2.jpg) |
| :---: | :---: |
| *Back-shot, back cover removed.* | *Macro-shot of the solder connection.* |

| ![](/assets/media/liberating-android/new_back.jpg) | ![](/assets/media/liberating-android/assembled.jpg) |
| :---: | :---: |
| *Back-shot, fully assembled.* | *Front-shot, fully assembled.* |

### Results

An (almost) fully functioning Samsung Galaxy Ace 4, without battery, powered using an USB charger:

<video
    height="800"
    controls
    autoplay
    muted
    preload="auto">
    <source src="/assets/media/liberating-android/final_result.webm" type="video/webm" />
</video>

However, all is far from perfect. Here is a list of issues:
- Bottom left side of the screen have a green tint, most likely damage from disassembly.
- Plugging the micro-USB cable in will produce a charging error notification, but does not hamper functionality in any way.
- BaconOS is only at Android 4.4.4, which is functional but quite outdated.
- Recent and Home buttons does not work due to a BaconOS bug. The back-button works without issue.
- Wi-Fi does not work (but USB-thetering does), due to a BaconOS bug. Might be for the best considering security implications of running such outdated software.

Knowing that it's possible to power a device such as the Galaxy Ace 4 with a USB charger, I will be looking at using old Android devices as drivers for other projects. Here are some uses from the top of my head:
- As a security camera.
- As a stand-alone music player.
- As a GPS.
- As a computational platform.
- As a connection proxy.
- As a smart home controller.

On another note, I had forgot how nice it used to be to reach the entire screen with one hand. Maybe we will see a return of small Android devices again in the future? One can hope.