# LINUX BOOTING PROCESS IN DETAIL

`https://docs.google.com/document/d/1LedJ-eCkVlSSzj21OmZI2ZNSICmz3amYT8PILhbQ2z4/edit?pli=1&addon_store `

Q. What happens behind the scene in linux when you press power button ?

![image](https://github.com/user-attachments/assets/b1ff9769-0c58-404b-9ca9-ae79d7c83c03)


### BIOS

- Basic Input Output System
- Performs POST(Power on Self Test) : Checks if all the hardware components are running in proper condition . If something is wrong it shows an error on screen . e.g : keyboard , screen , mouse etc
- Apart from BIOS , UEFI is also used

### MBR

- Master Boot Record
- It's size is 512 byte in it the size is divided as follows
  
  ![image](https://github.com/user-attachments/assets/cf79a3f0-d2e3-412a-8acb-281df69a23c3)
 
- Primary function of the MBR is to locate the bootloader program (like GRUB) on the disk and pass control to it.
- Partition table in the MBR (Master Boot Record) is crucial for organizing and managing the storage on a disk. It provides a map of how the disk's space is allocated and where different partitions (sections) of the disk begin and end.

### GRUB

- Grand Unified Boot Loader
- It uses  /boot/grub2/grub.cfg to determine how to boot the operating system .
- It is capable of reading filesystems, so it can locate and read the grub.cfg file.
- GRUB reads and parses grub.cfg to build the boot menu. This file contains directives and commands that tell GRUB how to load the kernel and initial ramdisk (initrd/initramfs), set kernel parameters, and configure the boot options.
- At this stage user will see the GUI asking different OS or kernels configured to boot .

![image](https://github.com/user-attachments/assets/4a8947de-926e-4ba8-a152-70bbbf1dca86)

GUI Prompt that GRUB gives

![image](https://github.com/user-attachments/assets/35b28987-0247-4d3a-a738-4efd46b657eb)

### Kernel

- Once the kernel and initrd/initramfs are loaded into memory, GRUB passes control to the kernel. At this point, GRUB’s job is essentially done, and the kernel takes over.
- When the kernel starts, it detects the initrd or initramfs that was loaded into memory by GRUB. It then unpacks initramfs into a temporary filesystem in memory or mounts initrd as a temporary block device.

![image](https://github.com/user-attachments/assets/0024f947-4e05-4fd7-8160-576b0da5e49b)

![image](https://github.com/user-attachments/assets/41c0a2cf-5005-4c11-9d5e-bb957e86bb5a)

- Basically Kernel mounts root file system and starts initial process usually `init` or `systemd` . `init` was in previous versions now there is `systemd`

### Systemd

![image](https://github.com/user-attachments/assets/82c101db-4ddc-458d-a382-294adf9371d0)

- In earlier versions of ubuntu there was run-levels but now there is targets
- To see different targets `cd /usr/lib/systemd/system` `ls -l runlevel*`
- To see the current target in which our system is running `systemctl get-default`









