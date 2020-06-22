#!/bin/bash

clustername=$1
servicename=$2

prevtime=$(sudo aws ecs describe-services --cluster $clustername  --service $servicename |jq '.services[].events[0].createdAt')

pattern='(.*has reached a steady state.*)'
count=0
while true
do
getcurrstatus=$(sudo aws ecs describe-services --cluster $clustername  --service $servicename |jq '.services[].events[0].message')
eventtime=$(sudo aws ecs describe-services --cluster $clustername  --service $servicename |jq '.services[].events[0].createdAt')

echo "eventtime -- $eventtime "
echo "getcurrstatus -- $getcurrstatus "

  if [[ ( $eventtime > $prevtime && $getcurrstatus =~ $pattern ) ]]
  then
  echo "Job is sucessful"
  exit 0
  break

  fi

 count=$[$count +1 ]
 if [ $count -gt  200 ]
 then
 echo " please check  the service its it not in steady state "
 exit 1
 fi

 sleep 6

done

