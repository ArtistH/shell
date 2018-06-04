#!/bin/sh


# Route
LOGIN_IP=`who am i | awk '{print $5}' | sed 's/(//g' | sed 's/)//g'`
LOCAL_GATEWAY=`ip route show | grep default | awk '{print $3}'`
NIC=`ip route show | grep default | awk '{print $NF}'`

echo "ip route add ${LOGIN_IP}/32 via ${LOCAL_GATEWAY} dev ${NIC}"
#ip route add ${LOGIN_IP}/32 via ${LOCAL_GATEWAY} dev ${NIC} > /dev/null 2>&1
