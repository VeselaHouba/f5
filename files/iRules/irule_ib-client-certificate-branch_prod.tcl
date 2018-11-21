# iRule for requesting client certificate
# - client IP is from AirBank network (branches, analytics, ...) = request client certificate
# - client IP is from another netword = ignore client certificate

when CLIENT_ACCEPTED {

   if { [IP::addr [IP::client_addr] equals 10.133.95.171] } {
      SSL::profile ib.airbank.cz_client_cert_new
   } elseif { [IP::addr [IP::client_addr]/16 equals 10.133.0.0] or [IP::addr [IP::client_addr]/16 equals 10.134.0.0] or [IP::addr [IP::client_addr] equals 172.20.61.2] } {
      SSL::profile ib.airbank.cz_client_cert
   }

}

