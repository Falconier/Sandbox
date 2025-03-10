# Ubuntu 22.04
apt update
apt upgrade -y
apt install software-properties-common gpg -y
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | tee /etc/apt/sources.list.d/mssql-server-2022.list



wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list)"
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/22.04/prod.list)"
apt update
apt upgrade -y
# Verify repository is added
apt-cache policy mssql-server
apt install -y mssql-server
# Run the configuration script
/opt/mssql/bin/mssql-conf setup
apt install -y mssql-tools unixodbc-dev sqlcmd