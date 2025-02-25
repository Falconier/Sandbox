from scapy.all import sniff

## 	24:C8:6E:11:36:33
##  10.0.0.27

# Define the target IP to capture packets from/to
target_ip = "10.0.0.27"

# Packet processing function
def packet_callback(packet):
    if packet.haslayer("IP"):
        if packet["IP"].src == target_ip or packet["IP"].dst == target_ip:
            print(packet.summary())

# Start sniffing on the desired interface (e.g., "eth0", "wlan0")
sniff(filter=f"host {target_ip}", prn=packet_callback, store=False)
