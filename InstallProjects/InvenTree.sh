# Ubuntu 20.04
apt update
apt upgrade -y
apt install gnupg -y
wget -qO- https://dl.packager.io/srv/inventree/InvenTree/key | apt-key add -
wget -O /etc/apt/sources.list.d/inventree.list https://dl.packager.io/srv/inventree/InvenTree/stable/installer/ubuntu/20.04.repo
apt update
apt install inventree -y