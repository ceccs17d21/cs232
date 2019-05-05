
#!/bin/sh

# OS, version, release number
lsb_release -a

# kernel version
uname -r

# list of all available shells
cat /etc/shells

# show CPU info
cat /proc/cpuinfo

# show memory info
cat /proc/meminfo

# show harddisk info 
sudo hdparm -I /dev/sda    

# show cache info
lscpu | grep cache

# show mounted filesystem
sudo fsck 
lsb_release