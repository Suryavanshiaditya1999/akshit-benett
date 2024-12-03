# FILEHANDLING 

- Ek `data.txt` nam ki file bna lo aur fir usme print kr skte hain kuch bhi using python only

![image](https://github.com/user-attachments/assets/fa0a087c-0c57-4ddf-8dfb-2c9a9c09a065)

- Dekh bhai , agar hum , `w` use krenge to write krega data , matlab ki preexisting data ko remove kr dega aur sirf jo data iss bar dia hai vhi reh jayega , agar `a` use krenge to append kr dega usi file m , agar `r` use krenge to hum fir read kr skte hain data .
- Write aur append krne k liye hum `write` function ka use krenge , aur read krne k liye hum `read` function ka istemal krenge . 

```
with open("data.txt" , "w") as file:
    a = file.write("ab jo hoga dekhenge")
    print(a)
```

![image](https://github.com/user-attachments/assets/c4c3ae33-0081-4e8f-9479-076e03fc175b)

- Without using `with` statement

```
# File kholte hain
file = open("data.txt", "w")   # Write mode

# File mein likhte hain
file.write("Bhai, yahan pe likhne ka funda simple hai!\n")

# File ko close karna zaroori hai, warna resource leak!
file.close()

```

**NOTE** ye `write` ya fir  `read` ye dono hi function string accept krte hain , aur data ko as a string hi read krte hain , means agar tum write use kr rhe ho to tumhe string pass krni padegi , dictinory nahi pass kr skte , isi tarike se read function ka usek krte hain to ye fir manlo dictionary format m jo data hai use as a string hi read kr leta hai


- NOW USING JSON

```
import json
data = {"naam": "Aditya", "city": "Delhi", "skills": ["Python", "Terraform", "React"]}

with open("data.json" , "w") as file:
    json.dump(data,file)

with open("data.json" , "r") as file:
    loaded_data = json.load(file)

print(loaded_data)
```

- jo ye vali line hai

```
with open("data.json" , "r") as file:
    loaded_data = json.load(file)
```

- isko hum ese bhi likh skte the , jese humne first example m likha hai  , Lekin use hota ky ki

```
with open("data.json", "r") as file:
    r = file.read()
    print(r)
```

![image](https://github.com/user-attachments/assets/63b7594c-53a5-4d52-a2c6-ab2ebd1a702a)

![image](https://github.com/user-attachments/assets/8bd6110b-6aa3-40c1-962a-cf5b3a055072)



- NOW USE `data.txt` as sample and use loops to perform operation

- `data.txt`

```
ab jo hoga dekhenge
aare shi m yaar bhot kalesh ho re hain
chalo fir jhhomo 
ohh wow ky baat hai 
nahi yr
```

- Program to print all lines , from this file

```
with open("data.txt" , "r") as file:
    for i in file:
        print(i)

```

- Program to split the strings in between . 

```
with open("data.txt" , "r") as file:
    for i in file:
        j = i.split()
        print(j)
```

![image](https://github.com/user-attachments/assets/0eff70ce-ec10-43a5-aaad-1a532e3e0d4d)


