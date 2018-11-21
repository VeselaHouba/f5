### v0001
### irule_ib-static-prod
### Static context for IB PROD
### v0004 SR-520954 apple-app-site-association MF
### v0003 BAACC-4481, oprava v pripade ze sa pristupuje na properties 403->rewrite
### v0002 Druha verze set allowed_ip 1 nastaveno u else na 1 stejne jak to maji ostatni i-rule
### v0001 Prva verzia

#REDIRECT TO STATIC CONTEXT/BILL-MANAGER/IB
when HTTP_REQUEST {
     #ACCESS TO STATIC-HTML (Apache)
     if { ( [HTTP::uri] starts_with "/static-ib/" ) || ( [HTTP::uri] starts_with "/static-html/" ) || ( [HTTP::uri] starts_with "/applets/" ) || ( [HTTP::uri] starts_with "/apple-app-site-association" ) } { 
               HTTP::header replace Host "ibmn-static.banka.hci"
               pool "pool-ibmn-static"
     }

     # workaround by MT
     if { ( [HTTP::uri] starts_with "/applet-service-upload" ) || ( [HTTP::uri] starts_with "/service/document/" ) } {
               HTTP::header replace Connection "close"
     }
}
