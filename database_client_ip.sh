#! /bin/bash

if [ x"$1" == x"" ]; then
     echo "Please input database listening port."
fi

# show netstat all established connection
# and define yourself database listening port
netstat -an | grep ESTABLISHED | grep $1 > tmp_netstat

# output all client IP addresses and ports
awk '{if($4~'$1') print $5;}' tmp_netstat > tmp_ip

# output all client IP addresses
awk -F':' '{print $1}' tmp_ip > tmp_netstat

# echo all uniq client IP addresses of database
sort tmp_netstat | uniq

# clean tmp file of shell script
rm -f tmp_netstat
rm -f tmp_ip