Ref: http://jperrin.github.io/centos/2014/09/25/centos-docker-and-systemd/

to Build
	sudo docker build --force-rm -t <username>/rhel7:systemd-fixed4containers .
 
to Run
	sudo docker run --rm --privileged -ti --name rhel7-systemd -v /sys/fs/cgroup:/sys/fs/cgroup:ro <username>/rhel7:systemd-fixed4containers
