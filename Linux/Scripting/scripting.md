# SCRIPTING BASIC TO ADVANCE


- Create a directory and a subdirectory and in that subdirectory create a file with some dummy text in it

```
mkdir -p dir/sub_dir
echo "Hello World" >> dir/sub_dir/file.txt
```

To execute it

```
chmod +x file.sh
./file.sh
```

- Create a script that prints `Hello World` every 10 second

```
while true; do
  echo "Hello World"
  sleep 10
done
```

- **Variables**

  ![image](https://github.com/user-attachments/assets/640c6ae5-a6b3-43a0-8a8d-c79811f0c8ea)

- **How to read user input**

  ```
  read variable_name
  ```

- To prompt the user with a custom message, use the -p flag.

  ```
  read -p "Enter your age" variable_name
  ```

- EXAMPLE
  ```
  #!/bin/bash

  echo "This script will execute the sum of the numbers you'll provide"
  echo "Enter first number"
  echo ""
  read a
  echo "Enter second number"
  read b
  
  var=$((a+b))
  
  echo "Sum of numbers provided is $var"
  ```

- **IF ELSE**
  ![image](https://github.com/user-attachments/assets/643ff699-ea54-4c4a-8184-21a2027be026)
  ![image](https://github.com/user-attachments/assets/7089fbba-2c00-4c32-b3b4-774f9dcb6959)

  ```
  #!/bin/bash
  
  read -p "Enter the first number: " x
  read -p "Enter second number: " y
  if [ $x -gt $y ]
  then
  echo $x is greater than $y\
  elif [ $x -lt $y ]
  then
  echo $x is less than $y
  elif [ $x -eq $y ]
  then
  echo $x is equal to $y
  fi
  ```

- Addition and Subtraction Using Case Statement , Case is just like switch statement in other programming language
```
#!/bin/bash
choice=$1
num1=$2
num2=$3

case $choice in

add)
echo "adding two numbers"
echo $((num1 + num2))
;;

subtract)
echo "subtracting two numbers"
echo $((num1 - num2))
;;

*)
echo "invalid choice"
echo "valid choices are 'add' and 'subtract'"
echo "eg: ./script6.sh add 12 14"
echo "eg: ./script7.sh subtract 19 5"
;;
esac
```

To execute it

```
./filemanager.sh add 10 12

OUTPUT -> 22

./filemanager.sh subtract 10 12

OUTPUT -> -2
```

Basically , choice k andar jo variable h vo sabse pehle call hoga to isliye vo $1 p rhega , fir $2 par dusra pass hoga variable , jese isme value 10 pass hui to vo $2 ho gya isi tarike se $3 ho jata hai .

- **FOR LOOP**

  ![image](https://github.com/user-attachments/assets/ad8db2f3-f5b5-453a-8151-50ec563dcee0)
  ```
  #!/bin/bash
  for (( num=1; num<=5; num++ ))
  do
    echo "write your commands"
    echo "This is iteration $num"
  done
  ```

- **WHILE LOOP**
  ![image](https://github.com/user-attachments/assets/650c06ad-9097-455c-b7b8-9672b1c7ff2f)


- **FUNCTIONS**
   -  create a function then call it
  ![image](https://github.com/user-attachments/assets/77168ee6-3a28-4ebe-807d-3aadbd356c62)

![image](https://github.com/user-attachments/assets/1103142b-714e-4705-ac37-bbb4f1859ff4)

- ANOTHER EXAMPLE

  ```
  #!/bin/bash

  # Function to create a directory named 'dir'
  createdir() {
    mkdir dir
   }

  # Assigning the first script argument to the variable 'choice'
  choice=$1

  # Case statement to handle the user's choice
  case $choice in
    createDir)
        createdir
        ;;
    *)
        echo "Invalid choice"
        ;;
  esac
  ```

![image](https://github.com/user-attachments/assets/3c6ffd84-30bf-45cf-8d90-f6de35a0bd0f)

**Question**
** Write a script that will check the number of executions of that script, last User that executed the script and the time and date at which it was executed** 

```
#!/bin/bash

echo "script executed by user $(whoami) at $(date +"%r") on $(date +"%D")" >> log_execution.txt

echo "This script has been executed $(wc -l log_execution.txt | awk '{print $1}') times."

echo ""

echo "Last execution was done by user $(tail -n2 log_execution.txt | head -n1 | awk '{print $5}')"

echo ""

echo "Timing of last execution: $(tail -n1 log_execution.txt | head -n1 | awk '{print $7,$8,$9}') on $(tail -n1 log_execution.txt | head -n1 | awk '{print $11}')"


```

REFERENCES

- https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/ 
