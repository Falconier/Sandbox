apt update
apt upgrade
apt install -y net-tools curl unzip wget git
curl -fsSL https://tailscale.com/install.sh | sh

# If LDE (Lightweight Desktop Environment) is needed
# apt install xfce4 xfce4-goodies