when HTTP_REQUEST {

  if { [string tolower [HTTP::header Upgrade]] contains "websocket" }{
      set disable "true"
      #log local0. "Websocket detected, disabling ASM [IP::client_addr] [HTTP::uri]"
      ASM::disable
      #HTTP::disable
  }
# else {
#      if { [HTTP::uri] starts_with "/applet-service-upload" }{
#      # workaround by https://jira.abank.cz/browse/CT-4934
#         set disable "true"
#         log local0. "URI detected, disabling ASM [IP::client_addr] [HTTP::uri]"
#         ASM::disable
#      }
#  }
}
#when AVR_CSPM_INJECTION {
#     if { [info exists disable] } {
#          # analytics injects some stuff into requests, which breaks websocket
#          #log local0. "Websocket detected, disabling AVR [IP::client_addr] [HTTP::uri]"
#          AVR::disable_cspm_injection
#     }
#}
