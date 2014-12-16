Consider this before use sshd inside a conatiner
> http://blog.docker.com/2014/06/why-you-dont-need-to-run-sshd-in-docker/

Ref: https://docs.docker.com/examples/running_ssh_service/ 

* to Build
```sudo docker build --force-rm -t <username>/rhel7:ssh-server```
 
* to Run
```sudo docker run -d --name rhel7-sshserver  <username>/rhel7:ssh-server```

* now you can use
```sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' <conatiner id>```

* to get the IP addr and then

`ssh root@<container ip addr>`
