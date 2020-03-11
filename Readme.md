# Simple and easy to use kali in docker

This is a ready to go and simple to use kali docker image.  It includes all of the tools in the kali-full package as well as a few additional ones that are not included in kali by default.  A full list can be seen here https://tools.kali.org/tools-listing.

The container also installs oh-my-zsh and uses zsh as its shell.

The container assumes you will mount your working directory to /data.  It will also maintain the state of your zsh history.

## Running and Hack the Box

This image was built with Hack the Box challenges in mind, and will work with the HTB vpn.  In order to be able to connect to the HTB vpn you will need to give the container some additional privileges to allow it to create the tunnel.  It is advised to run the container as a persistantly running instance, then attach a terminal to it
Example commands:


    kali_run='docker run -v ${PWD}:/data --name kali -p 9080:80 -p 7000-8000:7000-8000 --cap-add=NET_ADMIN --device=/dev/net/tun --sysctl net.ipv6.conf.all.disable_ipv6=0 -d guyht/kali'
    kali_start='docker start kali'
    kali_stop='docker stop kali'
    kali_rm='docker rm kali   '
    ka='docker exec -it kali /bin/zsh'

You can now run `kali_run` to spin up a container

To attach your shell to the terminal just run `ka`

You can also start and stop the container using the `kali_start` and `kali_stop` commands
