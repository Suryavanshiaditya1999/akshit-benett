Let's take some sample data and practice Grep command using this 

```
Hello students, Deadpool is not your friendly neighbourhood spiderman . 
So is Deadpool better than wolverine ? that's a serious question .
Okay , lets not dive deep into deadpool and wolverine try to focus on
Linux , becuase if you learn linux you will become better than any superhero.
```

**Grab Deadpool from it**

```
grep deadpool filename
```

**Ignore upper and lower case while searching**

```
grep -i DeadPOol filename
```
![image](https://github.com/user-attachments/assets/dcc1fd0e-47c0-4afa-9c0d-530135750d6b)

**To see everything except given pattern**

Suppose a scenario happens where you want to see everything except the defined keywod
```
grep -iv Deadpool filename
```
**Count number of matches**

```
grep -i -c "DeadpOOL" filename
```

![image](https://github.com/user-attachments/assets/3ae5fb0b-453d-4dcc-a267-96939d306502)

**Find out the files containing specific word**

```
grep -l -i "Deadpool" *
```

`fil` and `filename` are violet because only they contain the word deadpool in them

![image](https://github.com/user-attachments/assets/ed03e945-ff7f-41b6-955a-dc3cb6877423)

we can also see which files contain our word by , below command will also yield similar result
```
grep -i Deadpool *
```

**Diplay only the matched pattern**
```
grep -o "wolverine" filename
```

![image](https://github.com/user-attachments/assets/d680fa97-3ac6-454a-80e2-fd815c176c84)

**To search for exact match of given word**

```
grep -w Deadpool filename
```

**Print line number while displaying output**

```
grep -n -i "wolverine" filename
```

![image](https://github.com/user-attachments/assets/dffe95b6-1847-4887-b0bf-ddbfb475302a)


**To search mutliple keywords in a file**

Till now we saw how to find one single word from a file , but to find multiple keywords in a file we will use -e argument
```
grep -i -e "Deadpool" -e "wolverine" filename
```

**To search words in multiple files**

to search word in multiple files

```
grep -i -e "Deadpool" -e "wolverine" filename fil
```

**Q. Lets create a key.txt file in which we put deadpool and wolverine**

Basically all the words that we want to find we will put inside one file lets say key.txt and then we will -f keyword to find the patterns defined in file

```
grep -i -f key.txt filename
```

![image](https://github.com/user-attachments/assets/c4b5cb9b-0a0d-4ccf-8949-5888505582ae)


![image](https://github.com/user-attachments/assets/d6e4dd2b-e800-469d-b914-061a487b00d1)

**Q. Print the matching line starting with given keyword**

If you know the starting of line and you want only that line from file , in this case the line is starting with hello

```
grep -i "^Hel" filename
```

![image](https://github.com/user-attachments/assets/8510ae26-195e-4549-9b6a-873127abb21a)


Q. Print the matching line ending with given keyword 

```
grep -i "Hel$" filename
```





