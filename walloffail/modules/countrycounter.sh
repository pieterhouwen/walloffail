#!/bin/bash
./formatcountry.sh | grep -v \# | grep -v Country | grep -v is | grep -v really | grep -v world | grep -v wide | tr '[:lower:]' '[:upper:]' | sort | uniq -c | sort -nr
