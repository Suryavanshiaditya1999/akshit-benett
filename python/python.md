## Different data types

`int` , `float` , `string` , `bool`

![image](https://github.com/user-attachments/assets/6efcca57-04bb-43fb-a94f-45676ad7e4a3)


## variables

Q. guess the answer 

a = 10
b = 15
b = a 

print(b)  

Ans . `10`  , left variable ki value right ko mil jati h , so `a` ki values `b` ko mil gyi

Q. User input 

name = input ( "What is your name ? ")
age = input (" What is your age ? ")

print ( "your name is " , name , "your age is " , age )

Q. Addd two numbers using function 

```
def add ( a , b):
    return a +b
    
print ( add( 10 , 15))
```

Q. check for input name

![image](https://github.com/user-attachments/assets/eeaff93a-abbf-414a-8cf5-bd0341e34259)

Q. Conditional Operator in python

![image](https://github.com/user-attachments/assets/15181fe5-e7d5-42c6-91c6-0b65abc8eb43)


Q. Create a caluclator in python 

```
operator = input(" choose an opertor: ( + , - , / , * ): ")

a = float(input("Enter the first number: "))
b = float(input("Enter the second number: "))

def calculator( a , b , operator):
    if operator == "-":
        return a - b
    elif operator == "+":
        return a + b
    elif operator == "/":
        return a -b
    elif operator == "*":
        return a * b
    else:
        return " Error : Invalid operator"
        
        

print(calculator(a, b, operator))

```

![image](https://github.com/user-attachments/assets/3a5647c2-4b52-45c2-b125-a68e2166792a)

Q. Palindrome , palidrome is a word that is same from backward as from forward like `madam` if you reverse it you will get `madam`

```

s = input("type something that you want")

reverse = s[::-1]

if ( s == reverse ) :
    print("number is palindrome)
else:
    print("number is not palindrome")

```


**Q.LISTS**

the order in which elements are present inside list matters 

```
x = [1 , "Hello", True] 

print(x[1])
```

```
lists = [1 , "Hello", True] 

for x in lists:
    print(x)
```

![image](https://github.com/user-attachments/assets/d9e27122-10f6-4406-8c08-65abba036d92)


- Find out length

```
x = [1 , "Hello", True] 

print(len(3))
```

- Applying if else on it

```
x = [1 , "Hello", True] 

print(len(3))

if len(x)==3:
    print("list length is 3 ")
else:
    print("not length is 3")

```

- Appending

  ```
  x = [1 , "Hello", True] 

  x.append("2")
    
  print(x)
  ```

  ![image](https://github.com/user-attachments/assets/c1569df5-7216-45c1-9223-7c59c848841e)

- Lists are mutable , x does not store the actual values of the list , it stores only the refrence to the list

  ```
  x = [1 , "Hello", True] 

    x[0] = "One"

    print(x)
  ```



  
