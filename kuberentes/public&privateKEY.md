# [PUBLIC AND PRIVATE KEY](https://www.youtube.com/watch?v=_zyKvPvh808)

There are three ways to do encryption 

# ACTUAL COMMUNICATION 

![image](https://github.com/user-attachments/assets/b04052f2-a37c-4d23-b645-51cc78411bff)

- TLS : Pam ek message generate kregi , fir vo hashing algorith se use hash kr degi  , use ek `digest` create hoga 
  ![image](https://github.com/user-attachments/assets/9ba516a4-107e-49d0-bca0-2971a14b85d7)

- fir uss digest ko encrypt kr degi pam using her private keys , ab jo ye encrypted digest hai isko signature bolte hain , ye signature fir message par append ho jayega
  ![image](https://github.com/user-attachments/assets/43a75862-196f-431b-a91f-b35749d854ef)

- ab ye message aur signature dusre bande jim k pass jayega , ab kuki ye message pam ki private key se encrypt hua tha to ye pam ki hi public key se decrypt hoga
  ![image](https://github.com/user-attachments/assets/200145fc-669f-48ea-9665-ce03cd7b5d4e)

- ab ye jo digest jim ko mila hai agar vo same digest pam n bheja hai yaani apna tls successful rha
   ![image](https://github.com/user-attachments/assets/f1ef73e5-f018-4ee9-a7dd-0495d2792a5d)


