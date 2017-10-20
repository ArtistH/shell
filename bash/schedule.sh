#!/bin/sh

# http://bbs.chinaunix.net/thread-1772999-1-1.html
# timedatectl set-local-rtc 0 # 使用UTC模式校正RTC
# timedatectl set-local-rtc 1 # 使用当地时间校正

function date2days {
    echo "$*" | awk '{
    z=int((14-$2)/12); y=$1+4800-z; m=$2+12*z-3;
    j=int((153*m+2)/5)+$3+y*365+int(y/4)-int(y/100)+int(y/400)-2472633;
    print j
    }'
}

echo "Enter your date:"
read input_date
InpuDays=$(date2days ${input_date:0:4} ${input_date:4:2} ${input_date:6:2})
SysDays=$(date2days `date +"%Y %m %d"`)
let result=$InpuDays-$SysDays

echo "Enter your project:"
read input_project

echo ""
echo "${input_project}"
echo "-----------------------"
echo "| 24h   | `date +%Y%m%d --date="+1 day +$result day"`    |"
echo "-----------------------"
echo "| 3d    | `date +%Y%m%d --date="+2 day +$result day"`    |"
echo "-----------------------"
echo "| 7d    | `date +%Y%m%d --date="+6 day +$result day"`    |"
echo "-----------------------"
echo "| 15d   | `date +%Y%m%d --date="+14 day +$result day"`    |"
echo "-----------------------"
echo "| 30d   | `date +%Y%m%d --date="+29 day +$result day"`    |"
echo "-----------------------"
