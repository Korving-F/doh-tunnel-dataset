#!/bin/bash
sudo apt update
echo "[+] Install ansible"
sudo apt -y install ansible

echo "[+] Installing NGINX as proxy"
sudo add-apt-repository ppa:ondrej/nginx -y
sudo apt -y install nginx-full

# Create self-signed certificate
#sudo openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
#    -subj "/C=EE/ST=Harjumaa/L=Tallinn/O=TalTech/CN=192.168.0.10" \
#    -addext "subjectAltName = IP:192.168.0.10" \
#    -keyout /etc/ssl/private/192.168.0.10.key -out /etc/ssl/certs/192.168.0.10.crt

cat << EOF > /etc/ssl/certs/192.168.0.10.crt
-----BEGIN CERTIFICATE-----
MIIFqDCCA5CgAwIBAgIUYnQfjP+J+MOrPMu7q5vBqOEOKNcwDQYJKoZIhvcNAQEL
BQAwWzELMAkGA1UEBhMCRUUxETAPBgNVBAgMCEhhcmp1bWFhMRAwDgYDVQQHDAdU
YWxsaW5uMRAwDgYDVQQKDAdUYWxUZWNoMRUwEwYDVQQDDAwxOTIuMTY4LjAuMTAw
HhcNMjIwNTA3MDgyNDI0WhcNMjMwNTA3MDgyNDI0WjBbMQswCQYDVQQGEwJFRTER
MA8GA1UECAwISGFyanVtYWExEDAOBgNVBAcMB1RhbGxpbm4xEDAOBgNVBAoMB1Rh
bFRlY2gxFTATBgNVBAMMDDE5Mi4xNjguMC4xMDCCAiIwDQYJKoZIhvcNAQEBBQAD
ggIPADCCAgoCggIBAM/Luv5d02tONIA7XR4tnh4OR+8f4ghEy0hJi5s5x8opZL2X
z9nldjelnJ4nQANzMwsd2gqs6u0pUZtD1ZaYXSwBY0mixO6VTXLYSkuV/vxGIIWb
wply/69dUg1Sb1OyCp6RU09gJ8T9V5LYAiSWN9wkjp1FEWbzAbyeWBEpLCo9spSN
HUQ+4+R6tu/vSB6Q3S21k6nMe3Olt1dBofa4t2ZNcc0FR7c6K/BH35x6ISlK4Yh2
Gl985mIaHO5oD033cwU3mFFRwdpjftgUNw5XOoh9rLP/4ywSTs4cvys6jYWbxe8I
vt6+O3BQSA6sIK/JqzP1WKHRqA4OM3avvQxE5l0DYxEDEX6oxcsOoQmgvNQJBIdY
Rx+w3dqkqv8ZNV0bp7guUEbpKcT6z/9iSt7UWPXYJiQZxtCV+uappZL0zYJoTk7D
jM6FzD0TLHOGJRqZbrc8je2AOXJbuq7uONCt3iVLLIgpteS4HKOQn9j/y0mPCIst
eLzOCYHd42mGpFMPR5lq/JCw1LLcHgrps16K5jNrN/4PwX44wX2ziz8s0SjFe1tt
tOvM8NU3l13GaL6w/gVcC96re4ZAGF7AKl5NOeRvIDyn81z7Wkn+rxH7d9XDDd/s
N2XIwwZEJ2AviPq2iKgCr22nkZr19OiT44+y+y+VgpVgXuXwhibeVi9DJ5NPAgMB
AAGjZDBiMB0GA1UdDgQWBBTKW3jlOu8yv9y+dTvNV+DyaUo7WzAfBgNVHSMEGDAW
gBTKW3jlOu8yv9y+dTvNV+DyaUo7WzAPBgNVHRMBAf8EBTADAQH/MA8GA1UdEQQI
MAaHBMCoAAowDQYJKoZIhvcNAQELBQADggIBAKJYI6Yq+A+Y+NL9wZR6jXU4JCWJ
sqmbGj8YR0uDGheGFS1W+z3YKJsWrv2juZjMDrSMDrQNets20DSZz67xWtGBMKvQ
AVzIURt8ZJpJZgMGH4lukCje24QRddIQRZ8bmMtdAyP12W8oWc4qfkhLeKvTk4Q2
ekZtNrjKvUOBx9qmLHVruzVo5QyWMVgFMwMhX85B7j+Lhdp/EfdAq2K0wKi6Q24i
1RaJOGXV2/6dgtAOZijrO5HgSlF0bWyRkZWagjtlwAg2BBDXuS34DZDQNLEh2MmR
sccZMHmg/XcB/GfbzmxGmsj63G0gfi1gnIj32PeoN5MGNQuxoyfA7FdImHb/KP/X
yOoe88v08QmqDeUMB3dcCoGnBuKDFQThFeOOfWxKsjxBVYzWlyrbSmjU7lyBnXZY
fOLY8J11tEzB919W/b2w3Mzy1AAZfaK0akb3pLpeL4LWvnUvwsA++JMM2O1+tKXe
GpIBfHLxF1f4XCFSYQGUUsaxSJL5JF6jfDjfzDOssBdaiV9I+6YuPyXBTNHrgA+p
Vx5aS6blMQbAZbPcI4uzk9zO7jfaUkutbsR9MVePEAXJeGlf6N8wLwQdx3fI8o71
Rtyl+JQo9clEEPbj8uxYrjpVyafYncUA6o+zK955urxHwxX0VIRF77iY/reowM+m
LSUzyF9LL+uWSoqL
-----END CERTIFICATE-----
EOF

cat << EOF > /etc/ssl/private/192.168.0.10.key
-----BEGIN PRIVATE KEY-----
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
sYmqdTvYWQOrh0xv2UsOv8kM8IB81Vp7
-----END PRIVATE KEY-----
EOF


# Configure NGINX
cat << EOF > /etc/nginx/sites-available/dns-over-https
upstream dns-backend {
    server 127.0.0.1:8053;
}
server {
        listen 443 ssl;
        server_name 192.168.0.10;

        ssl_certificate     /etc/ssl/certs/192.168.0.10.crt;
        ssl_certificate_key /etc/ssl/private/192.168.0.10.key;
        ssl_protocols       TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
        ssl_ciphers         HIGH:!aNULL:!MD5;

        root /var/www/html/dns;
        access_log /var/log/nginx/dns.access.log;
        location /dns-query {
                proxy_set_header X-Real-IP \$remote_addr;
                proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
                proxy_set_header Host \$http_host;
                proxy_set_header X-NginX-Proxy true;
                proxy_http_version 1.1;
                proxy_set_header Upgrade \$http_upgrade;
                proxy_redirect off;
                proxy_set_header X-Forwarded-Proto \$scheme;
                proxy_read_timeout 86400;
                proxy_pass http://dns-backend/dns-query ;
                
        }
}
EOF

rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/dns-over-https /etc/nginx/sites-enabled/
sudo systemctl restart nginx


echo "[+] Installing DoH server"
# Install GO
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
mkdir ~/gopath
export GOPATH=~/gopath

# Install dns-over-https server
git clone https://github.com/m13253/dns-over-https.git
cd dns-over-https/
make
sudo make install

# Confiugure dns-over-https server
cat << EOF > /etc/dns-over-https/doh-server.conf
listen = [
    "127.0.0.1:8053",
    "[::1]:8053",
]

local_addr = ""
cert = ""
key = ""
path = "/dns-query"

upstream = [
    "udp:192.168.0.20:53",
]

timeout = 10
tries = 3
verbose = true
log_guessed_client_ip = false
ecs_allow_non_global_ip = false
ecs_use_precise_ip = false
EOF

# Setup DoH logging
cat << EOF > /etc/rsyslog.d/99-doh.conf
:syslogtag, startswith, "doh-server" /var/log/doh-server.log
EOF
sudo systemctl restart rsyslog

# Enable/disable, start/stop systemd services
sudo systemctl disable systemd-resolved
sudo systemctl enable doh-server.service
systemctl daemon-reload