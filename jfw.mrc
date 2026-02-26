;whowas reply: erorr but i'm fixing
raw 314:*: { .sockwrite -tn jfw1 who was $2  - multiple logins: $2- | halt }
;whoWas nonick reply
raw 406:*: { .sockwrite -tn jfw1 there was no such nickname. | halt }
;unknown command
raw 421:*:{
  if ($2 == 2-) {
halt  }
  else {
.sockwrite -tn jfw1 $2 - $3- | halt  }
}
;note: the iff statement fixes a command bug with /me - shrug

;not enough perams
raw 461:*: { .sockwrite -tn jfw1 $2 - $3-  | halt } 
raw 462:*: { .sockwrite -tn jfw1 $2 - $3-  | halt } 

;away broken? nope, workadoodle do
raw 301: { .sockwrite -tn jfw1 $2- | halt }
;more aways: you are you aren't
raw 305:*: { .sockwrite -tn jfw1  you are no longer marked as being away. | halt }
raw 306:*: { .sockwrite -tn jfw1  you are now marked as being away: some people will not see this  information, you are advised to inform open  channels you are away. | halt }


;server version
raw 351:*: { .sockwrite -tn jfw1 server  $2  - $4- | halt }

;who reply
raw 352:*: { .sockwrite -tn jfw1 $2- | halt }
;end of who
raw 315:*: { .sockwrite -tn jfw1 end of who list. | halt }

;info
raw 371:*: { .sockwrite -tn jfw1 $3- | halt }

;lucer commands
raw 251:*: { .sockwrite -tn jfw1  $2- | halt }
raw 252:*: { .sockwrite -tn jfw1  --- there are $2-  | halt }
raw 254:*: { .sockwrite -tn jfw1 --- $2- | halt }
raw 253:*: { .sockwrite -tn jfw1 and $2- | halt }
;error messages - some above
raw 401:*: { .sockwrite -tn jfw1 $2 doesn't exist: no such nickname or channel. | halt }

raw 404:*: { .sockwrite -tn jfw1 $2-  | halt }


raw 431:*: { .sockwrite -tn jfw1 know nickname given. | halt }

raw 432:*: { .sockwrite -tn jfw1 nickname invalid. | halt }
raw 433:*: { .sockwrite -tn jfw1 nickname $2 - already in use. | halt }
raw 442:*: { .sockwrite -tn jfw1 $2 - your not on that channel. | halt }
raw 646:*: { .sockwrite -tn jfw1 password incorrect. | halt }

raw 473:*: { .sockwrite -tn jfw1 cannot join channel: it is invite only. | halt }
raw 474:*: { .sockwrite -tn jfw1 you are banned. Unable to join. | halt }

raw 482:*: { .sockwrite -tn jfw1 You're not a channel operator. unable to perform command. | halt 
}

;channel list reading - not very necessary
raw 322:*: { .sockwrite -tn jfw1 $2 has $3  users. | halt } 
;name thinggy don't work).
raw 353:*: { .sockwrite -tn jfw1 on $3 there are: $4-  | halt } 


;motd
raw 372:*: { .sockwrite -tn jfw1 message of the day: $2-  | halt } 

; Full address, real name
raw 311:*: {
.sockwrite -tn jfw1 whoIs $2 ? Full address: $2 $+ ! $+ $3 $+ @ $+ $4
.sockwrite -tn jfw1  Real name given by $2 was $6-
halt
}

raw 319:*: { .sockwrite -tn jfw1 $2 is on  these Channels: $sorttok($3-,32,c) | halt }

raw 312:*: { .sockwrite -tn jfw1 server information for $2-  - Server: $3 ( $+ $4- $+ ) | halt }

raw 307:*: { .sockwrite -tn jfw1  $2 $2 $3- | halt }

raw 301:*: { .sockwrite -tn jfw1  $2 is away: $3- | halt }

; IRC operator status, the script is using $5- because some networks have different
; messages to indicate operator status. The string always begins like "is a/an", so
; cut out the first two words ($3-4)
raw 313:*: { .sockwrite -tn jfw1 $2 's Status: $5- | halt }

; DALnet help operator reply
;raw 310:*: { .sockwrite -tn jfw1 $2 $3- | halt }

; Idle time, some servers also give signon time (login time) which has to be converted with $asctime
raw 317:*: {
.sockwrite -tn jfw1  Idle time: $duration($3) --- 
if ( $4 isnum ) .sockwrite -tn jfw1  SignOn time: $asctime($4) ---
halt
}

; End of whois
raw 318:*: { .sockwrite -tn jfw1 End of Whois reply for $2 | linesep -s | halt }

on *:ctcpreply:ping*: { if ($2 isnum) { /mircsay $nick  ping reply $duration($calc($ctime - $2)) } }

on *:ctcpreply:version*:/mircsay $nick version reply: $1-

on *:ctcpreply:time*:/mircsay $nick time reply: $2-

on *:topic:*:/mircsay $nick on $chan changes topic to $strip($1-)

on *:unban:*:/mircsay $nick on $chan unbans $1-

on *:quit:/mircsay $nick has quit irc, $strip($1-)

on *:nick:{
  if ($nick == $me ) {
    /mircsay Your nickname is now $newnick
  }
  else {
    /mircsay $nick is now known as $newnick
  }
}

on *:notify:/mircsay $nick is on irc.

on *:unotify:/mircsay $nick has logged off irc.

on *:chat:*:/mircsay $nick in dcc chat says, $strip($1-)

on *:voice:*:/mircsay $nick on $chan voices $vnick

on *:devoice:*:/mircsay $nick on $chan devoices $vnick

on *:ban:*:/mircsay $nick on $chan bans, $1-

on *:op:*:/mircsay $nick on $chan ops $opnick

on *:deop:*:/mircsay $nick on $chan deops $opnick

on *:mode:*:/mircsay $nick sets modes $1- on $chan

on *:open:=:/mircsay Dcc chat with $nick connected.

on *:close:=:/mircsay Dcc chat with $nick closed.

raw 332:*:/mircsay topic on $2 is $strip($3-)

on *:dns:{
  if ($raddress == $null ) {
    /mircsay Dns lookup failed!
  }
  else {
    /mircsay Resolved $address to $raddress
  }
}

on *:action:**:*:/mircsay $nick $strip($1-)

on *:input:*:{
  if ($1 == /me ) {
    /mircsay $me $2-
    2-
  }
  else {
    /mircsay $me on $active says, $1-
  }
}

on *:kick:*:{
  if ($nick == $me ) {
    /mircsay $nick has kicked you off $chan $+ , $1-
  }
  else {
    /mircsay $nick has kicked $knick off $chan $+ , $1-
  }
}

on *:disconnect:/mircsay $me you've disconnected from $network network.

alias jfwstart /socklisten jfw 3498
on *:socklisten:jfw:.sockaccept jfw1

on *:start:/socklisten jfw 3498

alias mircsay /sockwrite -tn jfw1 $1-

on *:connect:/mircsay You've connected to $network network as $me

on *:join:*:{
  if ($nick == $me ) {
    /mircsay You've joined $chan
  }
  else {
    /mircsay $nick has joined $chan
  }
}

on *:text:**:#:/mircsay $nick on $chan says, $strip($1-)

on *:text:**:?:/mircsay $nick in private message says, $strip($1-)

on *:part:*:{
  if ($nick == $me ) {
    /mircsay You've left $chan
  }
  else {
    /mircsay $nick has left $chan
  }
}

on *:notice:**:#:/mircsay $nick on $chan notice, $strip($1-)

on *:notice:**:?:/mircsay $nick notice, $strip($1-)

on *:snotice:*:/mircsay Server notice, $2-

on *:error:*:/mircsay Closing nick, $me $+ , $host $+ , $1-

on *:disconnect:/mircsay You've disconnected from $network network
