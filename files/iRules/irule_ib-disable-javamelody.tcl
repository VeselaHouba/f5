### v0001
### irule_ib-disable-javamelody 
### Rewrite URL to javamelody
### PROD/PREPROD
### https://jira.homecredit.net/jira/browse/RT-102544
### v0001 Prva verzia

when HTTP_REQUEST {
   if { ([HTTP::uri] starts_with "/SsoLogin") || ([HTTP::uri] starts_with "/monitoring") } {
      HTTP::uri /notfound
   }
}

