#!/bin/bash
hashes=$(cat */*/dnsoverhttps/ja3/ja3_hash | sort -u)
for i in $hashes; do 
  echo "==================================================="
  echo "[+] Performing JA3 lookup at https://ja3er.com/ for hash: $i"
  echo "[+] This hash is found in the following scenarios:"
  found_files=$(grep $i -rnw . | cut -d':' -f1 | sort -u | cut -d'/' -f1-3 | sort -u)
  for file in $found_files; do 
    echo -e "\t[+] $file"
  done
  echo "[+] Search results:"
  curl -s -X GET "https://ja3er.com/search/$i" | jq
  echo "==================================================="
  echo
done