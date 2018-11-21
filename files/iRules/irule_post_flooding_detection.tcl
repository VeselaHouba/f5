### Ivan Dirbak - HCI a.s.
### irule_post_flooding_detection
### Detect POST flooding

when RULE_INIT {
   set static::maxRate 150
   set static::windowSecs 600
   set static::timeout 700
}

when HTTP_REQUEST {
if { [HTTP::method] eq "POST" } {
if { ! [class match [IP::remote_addr] equals white_list_post_flooding] } {
      #only IP which are not on whitelist
      set client_ip "[IP::remote_addr]"
      set currentTime [clock seconds]
      set windowStart [expr {$currentTime - $static::windowSecs}]
      set postCount 0
      foreach { requestTime  } [table keys -subtable "PH:${client_ip}"] {
         #count POSTs with start time > $windowStart, delete the rest
         if { $requestTime > $windowStart } {
            incr postCount 1
            #log -noname local0. "POST: $client_ip $requestTime $postCount"
         } else {
            table delete -subtable "PH:${client_ip}" $requestTime
            #log -noname local0. "DELETE POST: $client_ip $requestTime $postCount"
         }
      }
      if { $postCount < $static::maxRate } {
         set requestID "PH:${client_ip}"
            table set -subtable $requestID $currentTime "ignored" $static::timeout
            #log -noname local0. "POST FLOODING OK FROM IP ${client_ip} $postCount/$static::windowSecs (sec), limit $static::maxRate"
         } else {
            log -noname local0. "POST FLOODING DETECTED FROM IP ${client_ip} $postCount/$static::windowSecs (sec), limit $static::maxRate"
            return
         }
  }
}
}

