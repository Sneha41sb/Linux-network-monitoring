#!/bin/bash
LOG_FILE="logs/network.log"
echo "-----------------------------------" >> $LOG_FILE
echo "Linux network monitoring script started" >> $LOG_FILE
echo "Time: $(date)" >>$LOG_FILE
curl -I https://google.com > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "Internet Status: CONNECTED (HTTPS OK)" >> $LOG_FILE
else
    echo "Internet Status: DISCONNECTED" >> $LOG_FILE
fi
echo "" >> "$LOG_FILE"
echo "Open Listening Ports:" >> "$LOG_FILE"
ss -tuln >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
echo "Port to Process Mapping:" >> "$LOG_FILE"
sudo lsof -i -P -n >> "$LOG_FILE"
