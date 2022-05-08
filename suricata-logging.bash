#!/bin/bash
dirs=$(ls -d */*/dnsoverhttps)
for i in $dirs; do 
  echo "[+] Creating dedicated suricata directory."
  mkdir $i/suricata

  echo "[+] Running Suricata on pcap."
  suricata -c suricata.yaml -r $i/dns.pcap

  echo "[+] Moving Suricata log files."
  mv *.json $i/suricata/
  mv *.log  $i/suricata/
done