
#!/bin/sh
mkdir files
cd files
cat > commands.txt
cat > abc.txt
cat >> abc.txt
cat abc.txt
mkdir test
cat > a.txt
cat > b.txt
cat > c.txt
ls
ls -l
ls -lt
ls -ltr
ls a* -d
rm c.txt
cd ..
rm test/*
rmdir test

sort -n abc.txt
sort -nk7 abc.txt
sort -r abc.txt
sort -rnk7 abc.txt
sort -rn abc.txt

grep -c a.txt b.txt
cat > pqr.txt
grep -w 'hello' pqr.txt
grep -i 'Hello' pqr.txt
grep -c '1' abc.txt

mv c.txt /home/georgi/Desktop/
mv /home/georgi/Desktop/c.txt /home/georgi/Documents/script/scriptfiles/env1/files/

