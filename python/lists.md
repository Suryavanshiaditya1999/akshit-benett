Q. Write a Python program to create a list of all multiples of 5 within the range from 5 to 20 (inclusive).

```
multiples_of_5 = []
for i in range(5, 21):
    if i % 5 == 0:
        multiples_of_5.append(i)

print(multiples_of_5)
```

Q. Write a Python program to create a list of even numbers between 1 and 20 (inclusive) . 

```
even_number = []

for i in range(1,21):
    if i % 2 ==0:
        even_number.append(i)

print(even_number)
```

Q. You are given a set of integers. Write a Python program to:

- Find the maximum element in the set.
- Remove the maximum element from the set.
- Print the modified set after removing the maximum element.

  ```
  x = {1 , 3, 5, 6}

  y = max(x)
    
  x.remove(y)
    
  print(x)
  ```

## LIST COMPREHENSION

[VIDEO](https://www.youtube.com/watch?v=uhvljGKWges)
[LINK](https://www.w3schools.com/python/python_lists_comprehension.asp)

- Normal program for creating a cube of of numbers under 10 which are divisible by 2 . 

```
cubes = []
for x in range(10):
    if x % 2 == 0:
        cubes.append(x ** 3)
print("Using for loop:", cubes)
```

- List comprehension .

**`newlist = [expression for item in iterable if condition == True]`**


```
easy = [x ** 3 for x in range(10) if x % 2 == 0]
print("Using list comprehension:", easy)
```
basically ho ky raha hai 

krna ky hai , yaani ( x**3 ) ye krna hai , kiske liye krna hai ( x k liye )  , aur kha jake krna hai ( range(10)  ) , aur jo bhi uspar condition lagani hai  



```
fruits = ["apple", "banana", "cherry", "kiwi", "mango"]

new = [x for x in fruits if "a" in x]

print(new)
```
