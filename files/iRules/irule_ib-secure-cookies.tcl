### v0001
### irule_ib-secure-cookies 
### Secure cookies
### PROD/NON-PROD
### v0001 Prva verzia

when HTTP_RESPONSE {
   set sendCookies [HTTP::cookie names]
   foreach oneCookie $sendCookies {
      HTTP::cookie secure $oneCookie enable
   }
}

