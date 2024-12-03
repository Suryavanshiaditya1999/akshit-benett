# SYSTEM MONITORING COMMANDS 

- df
- du
- free
- lsblk
- lscpu
- fdisk

## `df` Command
Purpose: Displays information about disk space usage on mounted filesystems.

```
df -h
```
![image](https://github.com/user-attachments/assets/8f695e6c-5f98-421e-aa05-55b6371991b2)

- `tmpfs` : A temporary filesystem stored in RAM used for fast access to temporary files and runtime data, which does not persist after a reboot.

- `/dev/sda2` : A partition on the hard drive that holds the root filesystem (/), containing the core operating system files and directories. `14Gb` of space is used from `44GGb` available space.

**OUTPUT OF JUST `df` Command**

![image](https://github.com/user-attachments/assets/b2247943-bdd7-47e4-82a3-2d365f6c618a)

as you can see the data is not human readable that's why we use `df -h`

## `du` Command

Display disk usage of the current directory in a human-readable format.

![image](https://github.com/user-attachments/assets/48b027a4-47b3-434f-8836-e491330541b0)

To see disk space of specific directory

![image](https://github.com/user-attachments/assets/17e8a8fb-72f8-4e60-9698-1d817671c326)

## free 

Purpose: Displays information about the system's memory usage.

![image](https://github.com/user-attachments/assets/04e21420-2b71-4b10-a68b-3ddcfc5ce5d0)

The system have total 8Gb of Physical Memory(RAM) and 4Gb of Swap Space or Swap Memory

## lsblk

List all block devices:

![image](https://github.com/user-attachments/assets/d5bd6379-a6d0-4dd3-abbc-763af46c51a1)

- Loop Devices (e.g., loop0 to loop15):
  Definition: Virtual devices that allow files to be mounted and accessed as if they were physical disks. They are commonly used for mounting Snap packages and disk images.

- Physical Disk (sda):
   - sda1: A 1 MB partition on sda. It seems to be a very small partition, possibly for a special purpose like booting or partitioning.
   - sda2: A 44.6 GB partition on sda. This is the primary partition that contains your main filesystem.

- Optical Drive (sr0)
    - This represents an optical drive (like a CD/DVD drive). In this case, it appears to be a virtual or unused device, as no disk is currently mounted
    - This value is there to help the system manage the drive, regardless of whether a CD or DVD is currently inserted or no
 
## lscpu

Display CPU architecture information:

![image](https://github.com/user-attachments/assets/fcaf3a9d-294e-4aac-99e1-6005ea7c8067)

## fdisk

**NOT IMPORTANT TO TEACH**

```
sudo fdisk -l /dev/sda
```
![image](https://github.com/user-attachments/assets/a32d4523-9208-4369-8a9d-28d19d2e5d71)

```
sudo fdisk /dev/sda
```


![image](https://github.com/user-attachments/assets/ad52b44b-cfc7-473f-b991-fae8afcda129)








