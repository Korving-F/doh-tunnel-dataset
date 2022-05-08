#!/bin/bash
dirs=$(ls -d */*/dnsoverhttps)
for i in $dirs; do 
  echo "[+] Creating dedicated ja3 directory."
  mkdir -p $i/ja3

  echo "[+] Running tshark on pcap."
  tshark -r $i/dns.pcap -Y tls.handshake.type==1 -T fields -e ja3.hash  | sort -u > $i/ja3/ja3_hash
  tshark -r $i/dns.pcap -Y tls.handshake.type==2 -T fields -e ja3s.hash | sort -u > $i/ja3/ja3s_hash
done