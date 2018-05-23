#!/bin/sh

LOGIN_IP=`who am i | awk '{print $5}' | sed 's/(//g' | sed 's/)//g'`
echo ${LOGIN_IP}

LOCAL_IP_MASK=`ip add | grep inet | grep -v inet6 | grep -v 127.0.0.1 | awk '{print $2}'` 
echo ${LOCAL_IP_MASK}

LOCAL_NETWORK=`ipcalc -n ${LOCAL_IP_MASK} | awk -F"=" '{print $2}'`
echo ${LOCAL_NETWORK}

LOCAL_GATEWAY=`ip route show | grep default | awk '{print $3}'`
echo ${LOCAL_GATEWAY}

NIC=`ip route show | grep default | awk '{print $NF}'`
echo ${NIC}
