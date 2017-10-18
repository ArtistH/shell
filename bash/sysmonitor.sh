#!/bin/bash

# part1. Hardware Info
echo "Hardware Information"
echo "===================="
echo `dmidecode | grep "Product Name"`
echo ""
echo ""

# part2. System Version
echo "System Version"
echo "=============="
if [ -f /etc/system-release ] 
then
    SYS_VERSION=`cat /etc/system-release`
elif [ -f /etc/issue ]
then
    SYS_VERSION=`cat /etc/issue | awk -F'\\' {'print $1'}`
fi
echo $SYS_VERSION
echo ""
echo ""

# part3. CPU Info 
echo "CPU Information"
echo "==============="
CPU_MODEL=`cat /proc/cpuinfo | grep "model name" | awk -F':' '{print $2}' | uniq`
CPU_NUMS=`cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l`
CPU_CORES=`cat /proc/cpuinfo | grep "cores" | uniq | uniq | awk -F':' '{print $2}'`
echo "CPU Inforation : $CPU_MODEL"
echo "CPU(s) : $CPU_NUMS"
echo "CPU Cores : $CPU_CORES"
echo ""
echo ""

# part4. MEMORY Info
echo "MEMORY Information"
echo "=================="
cat /proc/meminfo | sed -n '1,3p'
echo ""
echo ""

# part5. Disk Info
echo "Disk Information"
echo "================"
fdisk -l
df -h
echo ""
echo ""

# part6. Network
echo "Network Information"
echo "==================="
ifconfig
netstat -rn
