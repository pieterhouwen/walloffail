#!/bin/bash
for i in $(cat networkoutput/masterwhoistable| sed '/[AA-ZZ]/!d' | grep -i country: | cut -d ":" -f 2 | sed '/[^Country]/!d')
do
echo $i
done
