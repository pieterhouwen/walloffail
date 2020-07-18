#!/bin/bash
COUNT=$(grep -i "password" /opt/zooi/walloffail/modules/failedattempts.txt | nl | cut -f1 | tail -n1)
echo There have been $COUNT failed login attempts
