# Ubuntu 22.04
apt update
apt upgrade -y
apt install curl software-properties-common gpg -y
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
# Next line may be required if public key is not in the keyring
# curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | tee /etc/apt/sources.list.d/mssql-server-2022.list
apt update
apt upgrade -y
apt install -y mssql-server
# Run the configuration script
/opt/mssql/bin/mssql-conf setup
apt install -y mssql-tools unixodbc-dev sqlcmd