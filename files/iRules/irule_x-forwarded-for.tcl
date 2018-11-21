##irule_x-forwarded-for
##SR-361513
##MF
##v0.1

when HTTP_REQUEST {
  if { [HTTP::header exists X-Forwarded-For]  } {
      HTTP::header remove X-Forwarded-For
  }
  HTTP::header insert X-Forwarded-For [IP::client_addr]
  HTTP::header insert X-WebLogic-KeepAliveSecs 30
}
