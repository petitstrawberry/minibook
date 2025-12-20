# minibook-support
Software for CHUWI MiniBook (8-inch) / MiniBook X (10-inch) / FreeBook N100 (14-inch) running Linux

- Enable the tablet mode of the MiniBook / MiniBook X / FreeBook N100 automatically when the MiniBook is folded.
- Calibrate the trackpointer of the MiniBook (8-inch).

## Requirements

- CHUWI MiniBook / MiniBook X / FreeBook N100
- Linux 6.9 or later
  - Needed for MiniBook X

### Dependencies

- base-devel
  - for Arch Linux
- build-essential
  - for Debian-based Linux

For other Linux distributions, please install the equivalent packages.

### Tested on

- MiniBook (8-inch)
  - Arch Linux
    - Linux 6.10.5-arch1-1
- MiniBook X (10-inch)
  - Ubuntu 24.04
    - Linux 6.10.6
- FreeBook N100 (14-inch)
  - Arch Linux
    - Linux 6.13.7-arch1-1

## Installation

### Arch Linux

AUR package is available.

```bash
yay -S minibook-support-git
```

### Build from source

For other Linux distributions.

```bash
git clone https://github.com/petitstrawberry/minibook-support.git
cd minibook-support
make
sudo make install
```

## Software

- [x] tabletmoded
- [x] trackpadd
- [x] keyboardd

### tabletmoded

tabletmoded is a daemon that triggers the tablet mode of the MiniBook.

- Auto detect the tablet mode
- Switch enable/disable the tablet mode
  - Trigger the tablet mode when the MiniBook is folded
  - Untrigger the tablet mode when the MiniBook is unfolded
  - Disable the keyboard using keyboardd when the tablet mode is triggered and enable the keyboard when the tablet mode is untriggered
  - Disable the trackpad using trackpadd when the tablet mode is triggered and enable the trackpad when the tablet mode is untriggered

### trackpadd

trackpadd is a daemon that manages the trackpointer / trackpad of the MiniBook. 

- Calibrate the trackpointer / trackpad
- Switch enable/disable the trackpointer / trackpad

### keyboardd

keyboardd is a daemon that manages the keyboard of the MiniBook.

- Switch enable/disable the keyboard

## Mechanism

trackpaddd / keyboardd create virtual devices that pass through input events received from the trackpadd / keyboard.  By enabling and disabling this pass-through functionality, you can stop and enable these devices. It is also possible to process the values if necessary (e.g. calibration of the track pointer with trackpadd).

tabletmoded calculates the open/close angle of the screen based on the values of the two accelerometers built into the main unit, and determines whether the PC is in tablet mode or not based on the angle. When it is determined that the PC is in tablet mode, it disables the trackpad and keyboard devices using trackpadd and keyboardd. Furthermore, it issues an event (SW_TABLET_MODE) to enable the tablet mode by the created virtual device, and notifies the whole system that the PC is in the tablet mode. Depending on the desktop environment, the behavior will change for tablets (e.g., GNOME will enable the on-screen keyboard).

This mechanism can be abused by keyloggers, etc., but of course we do not do any such processing, and you can check the source code if necessary.


## License

MIT License

Copyright (c) 2024 petitstrawberry

Please see [LICENSE](LICENSE) for more information.

## Credits

Debugging and testing on MiniBook X. 

Thanks to:
- [8796n](https://github.com/8796n)
- [kat0h](https://github.com/kat0h)
