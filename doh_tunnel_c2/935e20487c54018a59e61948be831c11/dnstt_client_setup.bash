#!/bin/bash
echo "[+] Installing DoH-client for transparent UDP to DoH conversion"
# Install Scenario dependencies
sudo apt update
sudo apt-get install -y sshpass asciinema socat

# Install GO
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
mkdir ~/gopath
export GOPATH=~/gopath

# Install DNSTT
git clone https://www.bamsoftware.com/git/dnstt.git
cd dnstt/dnstt-client
go build

# Add DoH-server's self-signed certificate to OS certificate store so GO can find it.
# https://stackoverflow.com/questions/40051213/where-is-golang-picking-up-root-cas-from/40051432#40051432
cat << EOF >> /etc/ssl/certs/ca-certificates.crt
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