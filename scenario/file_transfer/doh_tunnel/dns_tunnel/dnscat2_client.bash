#!/bin/bash
echo "[+] Installing Dnscat2 client and scenario dependencies"
sudo apt update
sudo apt-get install -y asciinema
git clone https://github.com/iagox86/dnscat2.git
cd dnscat2/client/
make

echo "[+] Installing DoH-client for transparent UDP to DoH conversion"
# Install GO
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
mkdir ~/gopath
export GOPATH=~/gopath

# Install dns-over-https client
git clone https://github.com/m13253/dns-over-https.git
cd dns-over-https/
make
sudo make install

# Confiugure dns-over-https client
cat << EOF > /etc/dns-over-https/doh-client.conf
# DNS listen port
listen = [
    "127.0.0.1:53",
    "127.0.0.1:5380",
    "[::1]:53",
    "[::1]:5380",
]

[upstream]
upstream_selector = "random"

[[upstream.upstream_ietf]]
    url = "https://192.168.0.10/dns-query"
    weight = 50

[others]
bootstrap = []
passthrough = []
timeout = 30
no_cookies = true
no_ecs = false
no_ipv6 = false
no_user_agent = false
verbose = true
insecure_tls_skip_verify = true
EOF


# Enable/disable, start/stop systemd services
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo systemctl start doh-client.service
sudo systemctl enable doh-client.service
systemctl daemon-reload