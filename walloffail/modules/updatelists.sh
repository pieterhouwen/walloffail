#!/bin/bash
# grep login ssh stuff and put in files
echo "getting ssh login data"
#
# Variables
#
savedir="/opt/zooi/networkouput/"
pwdir="/opt/zooi/walloffail/modules/"
#
#
# V3
grep "Failed password" $pwdir/failedattempts.txt | grep "user" | cut -d " " -f 6 | grep "\." | sort | uniq -c | sort -nr  >/opt/zooi/networkoutput/users-list
grep "Failed password" $pwdir/failedattempts.txt | grep "user" | cut -d " " -f 6 > /opt/zooi/networkoutput/users
grep "Failed password" $pwdir/failedattempts.txt | cut -d " " -f 6 | grep [0-9].[0-9].[0-9].[0-9] | grep -vi [a-z] > /opt/zooi/networkoutput/ips
grep "Failed password" $pwdir/failedattempts.txt | cut -d " " -f 6 | grep [0-9].[0-9].[0-9].[0-9] | grep -vi [a-z] | sort | uniq -c | sort -nr > /opt/zooi/networkoutput/ips-list
grep "Failed password" $pwdir/failedattempts.txt | cut -d " " -f 6 | grep -v [0-9].[0-9].[0-9].[0-9] | grep -i [a-z] >>  /opt/zooi/networkoutput/users
grep "Failed password" $pwdir/failedattempts.txt | cut -d " " -f 6 | grep -v [0-9].[0-9].[0-9].[0-9] | grep -i [a-z] | sort | uniq -c | sort -nr > /opt/zooi/networkoutput/users-list
#
# fixing stuff, atm does nothing.
#
sort /opt/zooi/networkoutput/users | uniq -u | sort > /opt/zooi/networkoutput/master-users
cp /opt/zooi/networkoutput/users-list /opt/zooi/networkoutput/master-user-list
cp /opt/zooi/networkoutput/ips /opt/zooi/networkoutput/masteriptable
sort /opt/zooi/networkoutput/masteriptable | uniq -c | sort -nr > /opt/zooi/networkoutput/masteriptable-numberd
sort -nr /opt/zooi/networkoutput/masteriptable | uniq -u > /opt/zooi/networkoutput/masteripsorted
#
# todo: make it smart.
#
# del trusted ip's
# Delete trusted IP's with this command: sed -i '/123.123.123.123/d' /opt/zooi/networkoutput/* # 
#
echo "finished"
#
#
