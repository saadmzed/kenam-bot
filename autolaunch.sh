#!/bin/bash
COUNTER=1
while(true) do
./kenam.sh
curl "https://api.telegram.org/bot201251462:AAH_7KKqh1CVReJmV8EgdnqIevXS0U0Ec3Imh-uag/sendmessage" -F "chat_id=1115307347" -F "text=#NEWCRASH-#kenam-Reloaded-${COUNTER}-times"
let COUNTER=COUNTER+1 
done