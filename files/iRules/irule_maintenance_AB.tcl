###v0001
###AB_release_block_all_except
###Block IP address from list
###I.Dirbak

when HTTP_REQUEST {
   set client_addr [IP::client_addr]
   if { [class match "YES" equals AB_release] } {
        if { not [class match $client_addr equals AB_private_networks] } {
             if { ! ([HTTP::uri] starts_with "/service") } {
                HTTP::uri "/"
             }
             pool pool-ibmn-service
         }
    }
}

