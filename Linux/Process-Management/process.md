# PROCESS MANAGEMENT AND RELATED COMMANDS

- Q. What is Process?  
  Running program in Linux is called a process.

- Q. Foreground Process vs Background Process
  
| Feature                  | Foreground Processes                             | Background Processes                             |
|--------------------------|-------------------------------------------------|-------------------------------------------------|
| User Interaction          | Requires user interaction                       | Does not require user interaction                |
| Terminal Blocking         | Blocks the terminal until completion            | Does not block the terminal                      |
| Execution Mode            | Runs in the foreground                          | Runs in the background                           |
| Example                   | `sleep 5`                                      | `sleep 100 &`                                   |
| Control                   | User has direct control                         | User has indirect control                        |
| Process Visibility        | Visible in the terminal output                  | Not visible in the terminal output               |
| Termination               | Can be terminated with Ctrl+C                  | Can be terminated using `kill` command          |

**Process States**

- **Running:** The process is currently executing or is ready to execute.
- **Sleeping:** The process is waiting for some event to occur (e.g., waiting for I/O).
- **Stopped:** The process has been stopped, typically by a signal.
- **Zombie:** The process has completed execution but still has an entry in the process table, allowing the parent process to read its exit status.

![Screenshot from 2024-06-29 16-21-23](https://github.com/user-attachments/assets/0eb4903b-2f90-4db4-ac73-2e07a2c8f6ce)



## `jobs` command
Description : The processes actively running in terminal session can be seen using `jobs` command .  


- Create a job `sleep 500 &` and then run `jobs` on terminal .

  ![image](https://github.com/user-attachments/assets/140c3f55-5b2d-464b-94bb-97c87ed32845)

## `fg` command

Put background process in foreground , and to start specific process `fg %job_numbered` 

![image](https://github.com/user-attachments/assets/e036b94b-417c-4e59-9032-72657b9d1a88)


## `bg` command

to send a process in background use `&`

```
sleep 20 &
```

Another way

- start a foreground process
  ```
  sleep 20
  ```

- stop it using `ctrl +z` now run it using `bg`
  
  ![image](https://github.com/user-attachments/assets/86b4284c-7337-47b9-9f15-16dd2ecf2830)

### ACTIVITY

- create 3 foreground sleep process , stop each of them using `ctrl +Z` command and then start the second process in background using `bg <job_id>` command

 ![image](https://github.com/user-attachments/assets/844ecdcf-c5b5-4021-9978-ddbcba21f940)




### ACTIVITY FOR JOBS COMMAND

- In one terminal, run 2-3 sleep commands and use jobs to see them listed.
  ![image](https://github.com/user-attachments/assets/ed102a0f-c738-4eb4-ac22-99fbdce03540)

- Open another terminal, `ps -ef | grep sleep` shows the running sleep commands, but `jobs` command will return nothing.
![image](https://github.com/user-attachments/assets/03ab37ca-eee2-4b0a-b25c-b6d14cab4f56)




## `kill` Command

Description : To kill the jobs running in the background
```
kill [option] [PID]
```
`option`: Signal name or number.  
`PID`: Process ID.


To view all the signals names.
```
kill -l
```
![image](https://github.com/user-attachments/assets/4f788a51-06ee-40e4-9031-c882bd46cd70)


To interrupt a running process just like `ctrl +c`
```
kill -2 PID
```

TO forcefully kill an process . It will kill an process immediately
```
  kill -9 PID
```

To gracefull kill an process . Basically it will stop the process and then kill it
```
kill -15 PID
```

Q. Kill a running process 

![image](https://github.com/user-attachments/assets/e0d720a9-2a5b-4e27-9aa3-423e65d5a700)

Q. Interrupt a running process

![image](https://github.com/user-attachments/assets/e930d1cb-e78f-4de6-9b6e-75665ce35d98)

## `pkill` Command

kill all the same process at once 

- Create multiple `sleep` process and kill all of them at once using `pkill`
![image](https://github.com/user-attachments/assets/5818cbf5-5996-42db-b445-1a7492479a8d)

- Forcefully kill a process
  ```
  pkill -9 chrome
  ```

## `nohup` Command

Purpose: nohup (short for "no hang up") is used to run a command or script that will continue running even after the user has logged out or the terminal has closed.

Q. How does it work ? 
- When you run a command with nohup, it ignores the SIGHUP (hangup) signal. This signal is typically sent when the terminal closes, causing processes to terminate

```
nohup command [arguments] &
```

Run a command and redirect output to a specific file:
```
nohup script.sh > output.log 2>&1 &
```

If you don't want to put log in any file

```
nohup sleep 50  >> /dev/null 2>&1 &
```

## nice and renice

![image](https://github.com/user-attachments/assets/2312b278-aa4e-41c5-ab7f-8758bf84fc07)

## 

https://www.youtube.com/watch?v=kmk3_kEiJvk
