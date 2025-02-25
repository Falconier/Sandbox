# Ubuntu 22.04
apt update
apt upgrade
apt install net-tools curl mysql-server unzip
# check version if pressent
java -version 
# install java if not present
apt install openjdk-8-jre-headless
# check version if pressent
java -version
# set up mysql
mysql_secure_installation
# complex password - NO
# change root password
# remove anonymous users -- YES
# disallow root login remotely -- YES
# remove test database and access to it -- YES
# reload privilege tables now -- YES
# EXIT MySQL
systemctl status mysql
mysql -v
# EXIT MySQL
# get version 2.8.1 of ArchivesSpace
wget 'https://github.com/archivesspace/archivesspace/releases/download/v2.8.1/archivesspace-v2.8.1.zip'
# unzip
unzip archivesspace-v2.8.1.zip
# update connnector
cd archivesspace-2.8.1/lib/
curl -Oq https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar
# update config
cd ../config/
nano config.rb
# update the database connection string with the root password
AppConfig[:db_url] = "jdbc:mysql://localhost:3306/archivesspace?user=as&password=_________&useUnicode=true&characterEncoding=UTF-8"
# uncomment the lines below and change to true
# AppConfig[:use_jetty_shutdown_handler] = true
# AppConfig[:jetty_shutdown_path] = "/xkcd"
# MAKE SNAPSHOT OF THE VM
# set up the database
cd ../scripts/
./setup-database.sh
# hopefully this will work
# then start the server
cd /archivesspace-2.8.1/
./archivesspace.sh
# commands: start stop status
# set up service in systemd
cd
# Archivesspace systemd service file
# # # [Unit]
# # # Description=ArchivesSpace Application
# # # After=syslog.target network.target

# # # [Install]
# # # WantedBy=mutti-user.target

# # # [Service]
# # # Type=forking
# # # ExecStart=/root/archivesspace/archivesspace.sh start
# # # ExecStop=/root/archivesspace/archivesspace.sh stop
# # # # PIDFile=/archivesspace/archivesspace.pid
# # # User=root
# # # Group=root
# # # Restart=on-failure
# # # RestartSec=20s
# Create symlink
cd /etc/systemd/system/
ln -s /lib/systemd/system/archivesspace.service
systemctl daemon-reload