#!/bin/bash
for file in `find /var/log -maxdepth 1 -name '*.log'`; do
filename=`echo $file | cut -f4 -d'/'`
lines=`wc -l $file | cut -f1 -d' '`
echo "$(date)|$file|$lines" >> /root/counts.log
#echo "$(date)|$filename|$lines" >> /root/counts.log
done
