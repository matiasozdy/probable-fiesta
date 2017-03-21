#!/bin/bash
for file in `find /var/log -name '*.log'`; do
filename=`echo $file | cut -f4 -d'/'`
lines=`wc -l $file | cut -f1 -d' '`
#echo "$(date)|$file|$lines"
echo "$(date)|$filename|$lines" >> /root/counts.log
done
