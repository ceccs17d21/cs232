
#!/bin/sh
route
route delete default gw 192.168.0.22
route delete default gw 192.168.0.20
ping 192.168.0.30
ping www.google.com