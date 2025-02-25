echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-enterprise.list
apt update
apt upgrade
apt install sudo apt-transport-https ca-certificates curl
mkdir -p --mode=0755 /etc/apt/keyrings
curl -fsSL https://debian.koha-community.org/koha/gpg.asc -o /etc/apt/keyrings/koha.asc
apt update
echo 'deb [signed-by=/etc/apt/keyrings/koha.asc] https://debian.koha-community.org/koha 24.11 main' | sudo tee /etc/apt/sources.list.d/koha.list
apt update
apt install koha-common
apt install mysql-server
nano /etc/koha/koha-sites.conf   ~    Change "INTRAPORT="80"" to "8080"
a2enmod rewrite cgi headers proxy_http
systemctl restart apache2
systemctl restart koha-common
koha-create --create-db kmcarchive
nano /etc/apache2/ports.conf  ~  Add Listen 8080 below Listen 80
a2dissite 000-default
a2enmod deflate
systemctl restart apache2
systemctl restart koha-common
koha-passwd kmcarchive