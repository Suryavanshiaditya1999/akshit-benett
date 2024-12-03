# [PYTHON TRY AND EXCEPT](https://www.w3schools.com/python/python_try_except.asp)

- Try and Except for fileNotFound

```
try:
    with open("dat.txt", "r") as file:
        file.read()
except FileNotFoundError:
    print("Bhenchod! shi nam dal file ka")
```

- for arithmetic operation

```
try:
    a = int(input("Bhai, ek number daal: "))
    b = int(input("Aur doosra bhi daal: "))
    result = a / b
    print("Result:", result)
except ZeroDivisionError:
    print("Bhenchod! Zero se divide karne chala tha? Calculator band kar de ab!") 
except ValueError:
    print("Bhai! Number daal na, characters nahi!") 

```


![image](https://github.com/user-attachments/assets/9ce26b5b-d012-41bc-9389-738fe720d163)
