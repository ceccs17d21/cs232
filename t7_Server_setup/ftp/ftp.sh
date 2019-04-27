
#!/bin/sh
sudo apt update
sudo apt install vsftpd
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
sudo ufw status
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo ufw allow 990/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw status
sudo adduser joremote
sudo mkdir /home/joremote/ftp
sudo chown nobody:nogroup /home/joremote/ftp
sudo chmod a-w /home/joremote/ftp
sudo ls -la /home/joremote/ftp
sudo mkdir /home/joremote/ftp/files
sudo chown joremote:joremote /home/joremote/ftp/files
sudo ls -la /home/joremote/ftp
sudo nano /etc/vsftpd.conf
echo "vsftpd test file" | sudo tee /home/joremote/ftp/files/test.txt
echo "joremote" | sudo tee -a /etc/vsftpd.userlist
cat /etc/vsftpd.userlist
sudo systemctl restart vsftpd