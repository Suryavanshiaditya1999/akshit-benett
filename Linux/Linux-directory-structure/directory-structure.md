![image](https://github.com/user-attachments/assets/ef86b189-cf21-4a4c-862e-879328a0b6f4)


# System Directories and Their Uses

Everything in Linux is file , even when we are typing ls , it is also a file and to know where ls is , we can do `which ls`  which might give an output like `/usr/bin/ls` 

- Linux Operating system stores and manage data on disk using filesystem
- Filesystem stores data in heirarchy and its related permission , at the top we have `/` (root)

## `/bin`
Contains essential command binaries that are available to all users (normal + priviledged user). Examples include:
- `ls`
- `cp`
- `mv`
- `cat`
- `echo`

## `/sbin`
Contains system binaries essential for system administration and system maintenance. These commands are typically used by the system administrator. Examples include:
- **`/sbin/ifconfig`**: Used for configuring network interfaces.
- **`/sbin/reboot`**: Used to reboot the system.

## `/etc`
Editable Text Configuration
Contains system-wide configuration files and directories for installed software.
Examples include:
- **`/etc/passwd`**: The password file.
- **`/etc/hosts`**: Used for defining local domain, especially for testing purposes.
- **`/etc/nginx`**: If Nginx is installed, this directory contains its configuration files, including `nginx.conf`.
- **`/etc/ssh`**: Contains configuration files for the SSH server and client, such as `sshd_config`.
- **`/etc/crontab`**: Contains the system-wide crontab file for scheduling periodic tasks.

## `/boot`
Contains all the boot-related information, files, and folders such as configuration files for the bootloader, kernel images, and initial RAM disk. An important directory in this location is:
- `/boot/grub`: Contains the GRUB bootloader configuration files. ( 

## `/home`
Contains the home directories for all users on the system. Each user has a personal directory where they store their personal files and configuration settings. For example:
- `/home/user1`: Home directory for user1.
- `/home/user2`: Home directory for user2.

## `/tmp`
Contains temporary files that are used by applications and can be cleared upon reboot. Examples include:
- Temporary files for sessions.
- If you create a file, such as `file.txt`, in the `/tmp` directory, it will be removed upon system restart. The directory is used for sharing temporary data among users working on the same system.

## `/opt`
Optional Application Add-on Packages
Contains optional application software and packages. Examples include:
- **`/opt/`**: you'll find subdirectories for different software applications. For example, if you install a third-party application like Apache,

![image](https://github.com/user-attachments/assets/d48ac8b7-734a-4e75-8c85-125063620553)

## `/proc`

- Process Information
- /proc filesystem exist only in RAM . It's a virtual filesystem meaning it does not exist on hardisk .
- It's way for kernel to expose the internal information to the user.
- Contains PID of processes running on system
- e.g , If you want to see CPU information `cat /proc/cpuinfo` , to check for memory usage `cat /proc/meminfo`


## `/usr`
User Programs
Contains read-only user-installed software and shared resources. This directory is used for storing applications and files that are not critical for system boot but are used for normal system operation. 
Contains binaries, libraries, documentation, source code of the application. Can also include shared binaries b/w users. Examples include:
- **`/usr/bin`**: Contains user binaries that are not essential for system boot.
- **`/usr/sbin`**: Contains system administration binaries that are not essential for system boot.
- **`/usr/lib`**: Contains shared libraries for user-installed applications. C programs library files needed by commands and apps .
- **`/usr/share`**: Shared data among users.
- **`/usr/src`**: Source code of linux kernerl, header files, documentation.

## `/var`
Contains variable data such as log files, cache and temporary files.
- **`/var/log:`** Stores system log files and application logs, which are essential for monitoring and troubleshooting system issues.
- **`/var/tmp:`** Contains temporary files that need to persist across reboots. Unlike /tmp, files in /var/tmp are not deleted when the system restarts.
- **`/var/lib:`** Stores variable state information and data for system services and applications, like database files and package management data.
-  **`/var/backup:`**
-   **`/var/lock:`** Lock files using an application so that other user cannot manipulate the data
## `/mnt`
Mount Dirs
External Hard disk mounted 

## `/media`
Mount point for removable media such as USB drives and CD-ROMs.
- **`/media/usb`**: Common mount point for USB drives.
- **`/media/cdrom`**: Common mount point for CD-ROMs.

## `/lib`
Contains shared system libraries and kernel modules essential for the system.
Essential files to help successfully run an application
- **`/lib/x86_64-linux-gnu`**: Contains 64-bit shared libraries for x86 architecture.
- **`/lib/modules`**: Contains kernel modules.

## `/root`
Home Dir for root user. Playground for Root user Other user cannot CD into it.

## `/dev`
Device files
Special type of files works as an interface b/w h/w and s/w
2 types of data transmit
- Block (b) : in chuncks, eg : Hard disk (sda1, sda2)
- Char (c) : In Character, eg : Mic, Speaker (port)

## `/sys`
system
Hardware and kernel related info
eg : module


