### v0001
### irule_ib-ssl-session-id 
### Add header SSL_SESSION_ID to HTTP request (kamil.krninsky@ys.cz)
### PROD/NON-PROD
### v0001 Prva verzia

when HTTP_REQUEST {
  HTTP::header insert SSL_SESSION_ID [SSL::sessionid]
  #log local0. "[IP::client_addr]:[TCP::client_port]: \[SSL::cipher version\]: [SSL::cipher version], \[SSL::sessionid\]: [SSL::sessionid]"
}

