when HTTP_REQUEST {
   if { ([HTTP::uri] starts_with "/wls-wsat") } {
    HTTP::redirect "http://www.google.com"  
   }
}

