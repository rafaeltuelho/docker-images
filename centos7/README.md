This is a slightly extend version of the official CentOS 7 base image with some util tools. 
All of my rhel 7 images extend this. So if you want to build one of them, this one must be build first.

* to Build

  ```sudo docker build --force-rm -t <username>/centos7-basic-tools . ```

* to Run

  ```sudo docker run -ti --name centos7 <username>/centos7-basic-tools```

* to access the Container's bash

  ```sudo docker exec -ti centos7 /bin/bash```

