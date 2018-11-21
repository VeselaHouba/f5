#IB_ENTROPY
### v0002
### irule_access-logs 
### Add header to request to identify call
### PROD/NON-PROD

when HTTP_REQUEST {
#we need to check if cookie exists
if { [HTTP::cookie exists "IB_ENTROPY"] } {
     set http_ibentropy [HTTP::cookie "IB_ENTROPY"]
  if { ![HTTP::header exists "IB_ENTROPY"]  }{
     HTTP::header insert IB_ENTROPY $http_ibentropy
  }
}
else {
     set http_ibentropy -
}
}
when HTTP_RESPONSE {
if { ![HTTP::header exists "IB_ENTROPY"]  }{
     HTTP::header insert IB_ENTROPY $http_ibentropy
  }
unset http_ibentropy 
}
