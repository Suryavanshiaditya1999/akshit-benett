# Inodes in Linux

## What is an Inode?

- **Definition:**
  - An inode is a data structure on a filesystem that stores metadata about a file or directory.
  - **Metadata Includes:** file permission , owner , group name , file size . It also contains :-
    - **Timestamps:**
      - **Creation Time:** When the file was created.
      - **Modification Time:** When the file's content was last modified.
      - **Access Time:** When the file was last accessed.
    - **Link Count:** The number of hard links pointing to the file.
  - **Important Note:**
    - The inode does **not** store the filename or file data itself. It only contains the metadata.

## Checking Inodes

- **Command to View Inode Number with Detailed Listing:**
  - Use the following command to display the inode number along with other details:
    ```bash
    ls -li
    ```

   ![image](https://github.com/user-attachments/assets/5bf19d0b-1fbb-4641-998f-25f7c4d84b80)

- **Command to View Inode Number of a file:**

  - **Example:**
    ```bash
    ls -i file.txt
    ```
    ![image](https://github.com/user-attachments/assets/15c68166-d2c6-48c1-83a6-6ba30ad0171b)

  - This command will show the inode number next to the file name.


## Characteristics

- **Uniqueness:**
  - Each inode number is unique within the filesystem.
  - No two files can have the same inode number within the same filesystem.

- **Inode Allocation:**
  - Inodes are allocated when files are created.
  - Each file or directory has a unique inode number that the filesystem uses to track it.

- **Usage:**
  - The inode helps the filesystem efficiently manage file metadata.
  - File data is stored separately, and the inode points to the data blocks.






