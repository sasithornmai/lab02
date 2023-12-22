#!/bin/bash
header=$(speedtest-cli --secure --csv-header)
echo $header > speedtest-sasithorn.csv
servers=$(speedtest-cli --list | awk -F ')' 'NR > 1 {print $1}')
for server in $servers
do
echo $(date) "Server ID: $server"
speedtest-cli --secure --server $server --csv >> speedtest-sasithorn.csv
echo "Done"
done
