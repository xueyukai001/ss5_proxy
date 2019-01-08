#!/bin/bash
if [ -n "$USER" -a -n "$PASS" ]
then
    echo "$USER $PASS" > /etc/opt/ss5/ss5.passwd
    sed -i "s#auth 0.0.0.0/0 - -#auth 0.0.0.0/0 - u#g" /etc/opt/ss5/ss5.conf
    sed -i "s#permit - 0.0.0.0/0 - 0.0.0.0/0 - - - - -#permit u 0.0.0.0/0 - 0.0.0.0/0 - - - - -#g" /etc/opt/ss5/ss5.conf
fi
#service ss5 start 
ss5 -t -u ss5
tail -f /var/log/ss5/ss5.log
