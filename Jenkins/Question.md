Q. Where is Jenkins Working directory  ? 

   - iss jagah par :  `var/lib/jenkins`

Q. What is we delete jenkins workspace by mistake , then what will happen ?? In How many ways we can take jenkins backup ?

Q. Jenkins configuration file kha hoti hai ? 

`etc/default/jenkins` 

- home directory change krne k liye , `JENKINS_HOME=/var/lib/$name`

Q. Ky hum apne Jenkins ka ip change kr skte hain ?

   - Hann bilkul , agar hum `HTTP_PORT=8080` ye change kr dein , iss file me se  `etc/default/jenkins` . 
