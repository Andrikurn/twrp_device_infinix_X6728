## TWRP device tree for Infinix HOT 60i (_X6728_)

## Device picture

<p align="left" width="100%">
<img width="33%" src="https://fdn2.gsmarena.com/vv/pics/infinix/infinix-hot-60i-2.jpg"> 
</p>

## Device specifications

Device                  | Infinix HOT 60i
-----------------------:|:-----------------------------------------
SoC                     | Mediatek Helio G81 Ultimate (12 nm)
CPU                     | Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)
GPU                     | Mali-G52 MC2
Memory                  | 4/6/8 GB RAM
Storage                 | 128/256 GB (eMMC 5.1)
MicroSD                 | microSDXC (dedicated slot)
Shipped Android Version | 15.0
Battery                 | Non-removable 5160 mAh
Display                 | 720 x 1600 pixels (~262 ppi density), 6.7 inches
Camera                  | 50 MP (wide); 8 MP (front, wide)

## Features

- [X] ADB
- [ ] Decryption (almost works)
- [X] Display
- [X] Fasbootd
- [X] Flashing
- [X] MTP
- [X] Sideload
- [X] USB OTG
- [X] Vibrator
- [X] MicroSD

## Building

Clone and sync twrp-12.1 manifest : 

```
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync
```

Clone device tree :

```
git clone https://github.com/Andrikurn/twrp_device_infinix_X6728.git -b dev-12.1 device/infinix/X6728
```

Build :

```
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_X6728-eng && mka clean && mka vendorbootimage -j$(nproc --all)
```