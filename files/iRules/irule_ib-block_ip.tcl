### v0001
### irule_block_ip
### Block IP address from list ib_blocked_ip_address
### PROD/NON-PROD
### v0001 Prva verzia

when HTTP_REQUEST {
   set client_addr [IP::client_addr]
   if { [class match $client_addr equals ib_blocked_ip_address] } {
          log local0. "INFO: $client_addr was DROPPED by F5"
          drop
    }
}
