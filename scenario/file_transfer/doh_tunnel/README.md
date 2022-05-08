# DNS Tunnel over DoH
## Description
Fullt automated file transfer over DoH Tunnel scenario.

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
│   ├── dnstt.yaml
│   ├── iodine_client_setup.bash
│   ├── iodine_server_setup
│   └── iodine.yaml
├── doh_tunnel.yaml
└── README.md
```
