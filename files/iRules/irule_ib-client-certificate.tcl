### v0002
### irule_ib-client-certificate
### Insert client certificate to header WL-Proxy-Client-Cert
### PROD/NON-PROD
### v0002 opravena chyba v iRule (variable not found)
### v0001 Prva verzia

when HTTP_REQUEST {
	if { [HTTP::header exists "WL-Proxy-Client-Cert"]} {
		HTTP::header remove WL-Proxy-Client-Cert
		}
	if { [SSL::cert count] > 0 } {
		set thecert [findstr [X509::whole [SSL::cert 0]] "-----BEGIN CERTIFICATE-----" 28 "-----END CERTIFICATE-----"]
		set certnospace [string map -nocase {" " "" \n "" \r ""} $thecert] 						  		
		HTTP::header insert WL-Proxy-Client-Cert $certnospace
                #log local0. "[IP::client_addr] $certnospace"
	}
}

