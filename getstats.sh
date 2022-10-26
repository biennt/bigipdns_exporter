#!/bin/bash
while true;
do
  tmsh show ltm dns cache resolver resolver > /tmp/cachestat.txt
  qps=`cat /tmp/cachestat.txt | grep -A2 'Client History' | grep 'Total Responses' | tr -s ' ' | cut -d ' ' -f4`
  hit=`cat /tmp/cachestat.txt | grep -A2 'Client Cache' | grep 'Hits' |  tr -s ' ' | cut -d ' ' -f4`
  miss=`cat /tmp/cachestat.txt | grep -A2 'Client Cache' | grep 'Misses' |  tr -s ' ' | cut -d ' ' -f4`
  echo "# TYPE qps gauge" > metrics
  echo "qps $qps" >> metrics
  echo "# TYPE hit gauge" >> metrics
  echo "hit $hit" >> metrics
  echo "# TYPE miss gauge" >> metrics
  echo "miss $miss" >> metrics
  sleep 5
done
