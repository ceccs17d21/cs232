
#!/bin/sh

touch sftp_test_1.txt
sftp cs17d21@http://14.139.189.217
?
version
ls
pwd
lpwd
mkdir sftp_test
cd sftp_test
put sftp_test_1.txt
rename sftp_test_1.txt sftp_t1.txt
lcd /home/georgi/Desktop
get sftp_t1.txt
rm sftp_t1.txt
cd ..
rmdir test
exit
