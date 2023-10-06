+ cat domestic.txt
+ cat pack.txt
+ cat domestic.txt pack.txt > human_friends.txt
+ cat human_friends.txt

+ mkdir animal_nursery
+ mv human_friends.txt /home/insomnia/animal_nursery

+ wget https://dev.mysql.com/get/mysql-apt-config_0.8.26-1_all.deb
+ apt install ./mysql-apt-config_0.8.26-1_all.deb
+ apt-get update
+ apt install -f mysql-client mysql-community-server mysql-server

+ dpkg -i mysql-apt-config_0.8.26-1_all.deb
+ dpkg -r mysql