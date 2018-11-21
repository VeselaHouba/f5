### irule_ib-wls-context-prod
### Send request to appropriate wls pool according context
### Use ib-wls-context datagroup list for PROD 

when HTTP_REQUEST {
     #Setup appropriate pool according to context
     if { ( [HTTP::uri] starts_with "/bill-manager" ) } {
          pool "pool-bill-manager" 
          HTTP::header replace Host "bill-manager.banka.hci"        
     }
     elseif { ( [HTTP::uri] starts_with "/kampane/" ) } {
          set CONTEXT [string map {"/kampane" "/bess" } [HTTP::uri]]
          HTTP::uri $CONTEXT
          pool "pool-sas" 
          HTTP::header replace Host "sas.banka.hci"        
          unset CONTEXT
     }
     elseif { ( [HTTP::uri] starts_with "/bea_wls_internal" ) } {
               drop
     } 
}

