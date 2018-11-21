### v0001
### irule_access-logs 
### Add header to request to identify call
### PROD/NON-PROD

when HTTP_REQUEST {
#we need to check if cookie exists
if { [HTTP::cookie exists "JSESSIONID"] } {
     set http_jsessionid [HTTP::cookie "JSESSIONID"]
  if { ![HTTP::header exists "J-Session-ID"]  }{
     HTTP::header insert J-Session-ID $http_jsessionid
  }
}
else {
     set http_jsessionid -
}
}
when HTTP_RESPONSE {
if { ![HTTP::header exists "J-Session-ID"]  }{
     HTTP::header insert J-Session-ID $http_jsessionid
  }
unset http_jsessionid 
}

