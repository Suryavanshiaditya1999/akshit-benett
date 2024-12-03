#!/bin/bash

choice=$1

case $choice in
  presentdir)
    pwd
    ;;
  create_dir)
  mkdir linux
  ;;
  another_dir)
  cd /tmp
  cd linux
  mkdir Assignment01
  ;;
  second_dir)
  cd /tmp
  mkdir -p linux/Assignment01/dir1/dir2
  ;;
  deletedir3)
  cd /tmp
  rm -rf linux/Assignment01/dir1/dir2
  ;;
  emptyfile)
  cd /tmp
  touch aditya
  ;;
  adding_line)
  cd /tmp
  echo "this is first line" >> aditya
  ;;
  adding_one_more_line)
  cd /tmp
  echo "adding one more line line in file" >> aditya
  ;;
  last_name_file)
  cd /tmp
  touch suryavanshi
  echo "adding last line" >> suryavanshi
  ;;
  addNewlne)
  cd /tmp
  echo "New line at the end of a line" | cat - suryavanshi > temp_file && mv temp_file suryavanshi
  ;;
  addingmorelines)
  cd /tmp
  echo "adding second line" >> suryavanshi
  echo "adding third line" >> suryavanshi
  echo "adding fourth line" >> suryavanshi
  echo "adding fifth line" >> suryavanshi
  echo "adding sixth line" >> suryavanshi
  echo "adding seventh line" >> suryavanshi
  ;;
  show_top_five_lines)
  cd /tmp
  head -n 5 suryavanshi
  ;;
  bottom_two_lines)
  cd /tmp
  tail -n 2 suryavanshi
  ;;
  only_sixth_line)
  cd /tmp
  head -n 6 suryavanshi | tail -n 1
  ;;
  three_to_eight_lines)
  cd /tmp
  head -n 8 suryavanshi | tail -n +3
  ;;
  listallContent)
  cd /tmp
  ls -a
  ;;
  list_only_files)
  ls -p | grep -v /
  ;;
  list_only_dir)
  ls -d */
  ;;
  copy_file_to_dir2)
  cd /tmp
  cp suryavanshi linux/Assignment01/dir1/dir2
  ;;
  again_copy)
  cd /tmp
  mv suryavanshi last-name
  mv firstname /linux/Assignment01/dir1
  ;;
  change_name)
  cd /tmp
  mv aditya first-name
  ;;
  move_file)
  cd /tmp
  mv aditya /linux/Assignment01/dir1
  ;;
  clear_content)
  cd /tmp
  truncate -s 0 /linux/Assignment01/dir1/aditya
  ;;
  delete_file)
  cd /tmp
  rm /linux/Assignment01/dir1/aditya
  ;;
  *)
    echo "invalid"
    ;;
esac
