### Q. Agar mujhe changes implement krne hai , to m `sites-enable` k default m ya fir `site-available` k default file m ya fir `nginx.conf` kisi bhi file m dal du , changes implement ho jate hain esa ku ?? Manlete hain mujhe upstream ka block add krna hai , m teeno m se kisi bhi file m add kru vo changes implement ho jate hain esa kese ??

- Ideally changes ko hum new file bna `/etc/nginx/conf.d` iss folder k andar bna k implement kr dete hain .. 

![image](https://github.com/user-attachments/assets/de2d49be-913b-4183-b88d-b9229bb02e1b)


- Basically nginx.conf k andar include kra hota hai `site-enable` vali directory aur `site-enable` soft link par hoti hai `site-available` k saath isliye , hum `site-enable` m changes kre ya fir `site-available` krein changes pure nginx m implement ho jate hain kuki , `nginx.conf` k andar humne include kr rakha hai `sites-enabled` ko .. isliye sabse important file jo hui vo `nginx.conf` hui . 

```
	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
```

![image](https://github.com/user-attachments/assets/f49fc946-b7e1-4842-bbc3-b7d633d5a044)

**BEST PRACTICE**

![image](https://github.com/user-attachments/assets/3965d598-fefc-486f-9191-c09ad49e8812)



### Q. Loadbalancing k kitne tarike hote hain nginx mein ?? policy type btana .. ?

- **Weighted policy**

```
upstream backend_servers {
    server 192.168.1.10:8080 weight=3;   # Server 1 ki IP
    server 192.168.1.11:8080 weight=2;   # Server 2 ki IP
    server 192.168.1.12:8080 weight=1;   # Server 3 ki IP
}
```

![image](https://github.com/user-attachments/assets/dbf9c8b5-5c72-46f8-9001-fe2381437fc5)

- Matlab stable server par 50% laod de dia , use thode kam stable par 33% aur usse bhi kam stable par 17% .



- **Least Connection**

![image](https://github.com/user-attachments/assets/04f7034a-1525-4c1f-a873-73620eec95fa)






