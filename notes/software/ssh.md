# SSH

# SSH tunneling

We want to access a computer inside a network without accessing the gateway server every time. In order to do that, we establish a tunnel between port 5555 in our computer (any port > 1024 would do), and port 22 of the target computer.

```
host.outside$ ssh -f -X me@public_computer.domain1 -N -L 5555:network_computer.domain2:22

# enter password

host.outside$

# copy file from computer2:/home/me/whatever/file_to_tranfer.tgz to host.outside:/whatever/you/want

host.outside$ scp -P 5555 me@localhost:/home/me/whatever/file_to_tranfer.tgz /whatever/you/want

# enter password again
```

# Login without password

Copy the public key in .ssh/id_rsa.pub from your computer to .ssh/authorized_keys in the target.

# Keep SSH sessions alive

As explained [here](https://sysadmincasts.com/episodes/39-cli-monday-how-to-keep-your-ssh-sessions-alive), when an SSH connection is idle for quite some time, it is usual to find the session frozen and/or closed with one infamous messages like `Write failed: Broken pipe`
or `Connection to localhost closed.` To solve that, modify `.ssh/config` adding this line:

```
Host *
  ServerAliveInterval 60
```
