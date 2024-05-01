# Configuring Static IPv4 Address on Ubuntu 22.04 Server with CLI 🛠️

📝 Ubuntu uses the Netplan as a network manager that is responsible for configuring the network interfaces. Follow the below steps.

## Usage 📑

1. Create or edit the network configuration file under the /etc/netplan directory. Create a configuration file and edit it in an editor:


```bash
sudo vi /etc/netplan/00-installer-config.yaml
```
  🔸 Add the network configuration in YAML format as below:

```yaml
network:
  ethernets:
    enp0s3:
      addresses: [192.168.1.100/24]
      gateway4: 192.168.1.1
      nameservers:
              addresses: [8.8.8.8, 8.8.4.4]
  version: 2
```
🔸  In the above configuration:

`enp0s3` – is the network interface name

`addresses` – is used to configure IPv4 address on an interface. Make sure to define CIDR. You can add multiple addresses here

`nameservers` – Set the name servers here. 8.8.8.8 and 8.8.4.4 are Google’s name servers

`gateway4` – This is used to set gateway on your system.

Make sure the IPv4 address belongs to the system network and has the correct gateway Ip address. Once confirmed, save file content and close it.

2. Apply the changes by running the following commands.Now, execute the following command to apply the changes:

```bash
sudo netplan apply 
```
That’s it. The static IP address is configured on your Ubuntu system.✔️

You can also configure multiple IP addresses on a single network interface. 🛠️