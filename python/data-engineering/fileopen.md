![image](https://github.com/user-attachments/assets/dc0ceb7f-2a20-4501-8283-f191d7685426)![image](https://github.com/user-attachments/assets/a1e7ba87-2fbc-42b5-82fa-a5b2a4aa0e8b)


**SETS**

- Set only takes unique values , even if you try and put duplicate values , when you print them you get unique values

![image](https://github.com/user-attachments/assets/e5a6f48d-0260-4c79-a4cd-1edfe36db6f7)

```
set = { 1 , 1 , 2 , 2, 4 , 4}
print(set)
```

![image](https://github.com/user-attachments/assets/5dc9d254-50c8-4d4d-84a8-9cef2e91af63)



Read first ten lines from a given csv file , using low level file reading api's such as `r` . 

```
order_file = open("retail_db/orders/part-00000", "r")
order_read = order_file.read()

order_str = order_read.splitlines()

order_str[:10]
```
