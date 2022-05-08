#!/bin/bash
echo "[+] Installing Dnscat2 server and scenario dependencies"
sudo apt update
sudo apt install -y ruby ruby-dev asciinema libtext-lorem-perl
git clone https://github.com/iagox86/dnscat2.git
cd dnscat2/server/
sudo gem install bundler
sudo bundle install
sudo lorem -p 1000 > /root/test-file