### v0001
### irule_ib-allowed-methods
### Send access log to syslog
### PROD/NON-PROD
### v0001 Prva verzia M.F.


when HTTP_REQUEST {
   #log local0. "NEW METHOD [HTTP::method]"
   if { not [matchclass [string toupper [HTTP::method]] equals ib-allowed-methods ] } {
       log local0. "BLOCK METHOD [HTTP::method]"
       persist none
       HTTP::redirect https://ib.airbank.cz/expired 
   }

}

