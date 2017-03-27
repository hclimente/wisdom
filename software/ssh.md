# SSH

## SSH tunneling

We want to access a computer inside a network without accessing the gateway server everytime. In order to do that, we establish a tunnel between port 5555 in our computer (any port > 1024 would do), and port 22 of the target computer.

```
host.outside$ ssh -f -X me@public_computer.domain1 -N -L 5555:network_computer.domain2:22

# enter password

host.outside$

# copy file from computer2:/home/me/whatever/file_to_tranfer.tgz to host.outside:/whatever/you/want

host.outside$ scp -P 5555 me@localhost:/home/me/whatever/file_to_tranfer.tgz /whatever/you/want

# enter password again
```