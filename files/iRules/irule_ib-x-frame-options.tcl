### v0001
### irule_ib-x-frame-options 
### Add x-frame-options to reponse header
### PROD + NON-PROD
### https://jira.homecredit.net/jira/browse/BAACC-3640
### https://developer.mozilla.org/en-US/docs/The_X-FRAME-OPTIONS_response_header
### v0001 Prva verzia

when HTTP_RESPONSE { 
    HTTP::header insert "X-FRAME-OPTIONS" "SAMEORIGIN"
}

