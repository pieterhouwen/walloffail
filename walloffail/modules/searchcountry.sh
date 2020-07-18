#!/bin/bash
echo Grepping whois DB. . .
for i in $(cat /opt/zooi/networkoutput/masterwhoistable)
do
fieldnine=$(grep -i country: | grep -v network:country | cut -d ":" -f 2 | cut -d " " -f9- )
if [ $fieldnine -eq " " ]
then
echo Wrong field!
fi
done
