when HTTP_REQUEST { 
 set client_addr [IP::client_addr]
     if { ([HTTP::uri] starts_with "/admin") and (not [class match $client_addr equals AB_private_networks]) } {
          HTTP::redirect "https://ib.airbank.cz"
        }
}
