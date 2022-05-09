#!/bin/bash
dirs=$(ls -d */*/dnsoverhttps)
for i in $dirs; do 
  echo "[+] Running tshark on pcap to inspect SNI field in pcaps."
  tshark -r $i/dns.pcap -p -Tfields -e tls.handshake.extensions_server_name -Y 'ssl.handshake.extension.type == "server_name"'
done
