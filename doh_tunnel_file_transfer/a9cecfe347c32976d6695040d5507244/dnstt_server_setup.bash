#!/bin/bash
echo "[+] Installing DNSTT-server for DoH tunneling"
# Install Scenario dependencies
sudo apt update
sudo apt-get install -y libtext-lorem-perl asciinema socat

# Setup test file
lorem -p 10000 > /root/test-file

# Install GO
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
mkdir ~/gopath
export GOPATH=~/gopath

# Install DNSTT
git clone https://www.bamsoftware.com/git/dnstt.git
cd dnstt/dnstt-server
go build

# Final scenario prep tasks
echo "[+] Disabling systemd-resolved"
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved

echo "[+] Prepare SSHD configuration"
sed -i 's/#*PermitRootLogin.*/PermitRootLogin yes/g'             /etc/ssh/sshd_config
sed -i 's/^UsePAM yes/#UsePAM yes/g'                                /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g'   /etc/ssh/sshd_config
systemctl restart sshd

echo "[+] Change root password"
sudo echo "root:root" | chpasswd