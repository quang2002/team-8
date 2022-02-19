#!/bin/bash

# ten may
HOSTNAME=`hostname`
echo "Ten may: $HOSTNAME"

# ban phan phoi, phien ban
IFS='='
read -ra arr <<< `grep "^NAME=" /etc/os-release`
echo "Phien ban phan phoi: ${arr[1]//\"/}"

read -ra arr <<< `grep "^VERSION_ID=" /etc/os-release`
echo "Phien ban he dieu hanh: ${arr[1]//\"/}"

# thong tin phan cung
IFS=':'

read -ra arr <<< `grep "^model name" /proc/cpuinfo`
echo "Ten CPU: ${arr[1]// /}"

read -ra arr <<< `grep "^clflush size" /proc/cpuinfo`
echo "CPU Bit: ${arr[1]// /} bit"

read -ra arr <<< `grep "^cpu MHz" /proc/cpuinfo`
echo "Toc do: ${arr[1]// /} MHz"


# cat /proc/meminfo
IFS=':'
read -ra arr <<< `grep "^MemTotal:" /proc/meminfo`
arr[1]=${arr[1]// /}
arr[1]=${arr[1]:0:-2}
echo "Thong tin bo nho vat li (tong bao nhieu MB): `expr ${arr[1]} / 1024` MB"

# thong tin bo nho hard disk
info=$(df -h)
IFS=$'\n'
totalFree=0
for i in ${info[@]}; do
    IFS=' '
    read -ra ADDR <<< "$i"
    ADDR[3]=${ADDR[3]/,/\.}
    case ${ADDR[3]: -1} in
        "M")
            totalFree=`echo $totalFree + ${ADDR[3]:0:-1} \* 1024 | bc -l`
            ;;
        "G")
            totalFree=`echo $totalFree + ${ADDR[3]:0:-1} \* 1024 \* 1024 | bc -l`
            ;;
        "T")
            totalFree=`echo $totalFree + ${ADDR[3]:0:-1} \* 1024 \* 1024 \* 1024 | bc -l`
            ;;
        "K")    
            totalFree=`echo $totalFree + ${ADDR[3]:0:-1} | bc -l`
            ;;
    esac
done

totalFree=$(echo $totalFree / 1048576 | bc -l)
printf "Bo nho trong: %.2f GB\n" ${totalFree/\./,}


# curl ifconfig.me
IP=$(curl -s ifconfig.me)
echo 'IP:' $IP

# list users
info=$(grep "/home/.*:/usr/bin" /etc/passwd)
IFS=$'\n'
echo "Danh sach user dang co tren he thong:"
for i in ${info[@]}; do
    IFS=':'
    read -ra ADDR <<< "$i"
    echo "${ADDR[0]}"
done

# list all process running with root permission
echo "Danh sach cac tien trinh dang chay co quyen root:"
ps -ef | grep "^root"

# information of open ports
echo "Danh sach cac port dang mo:"
netstat -tulpn | grep LISTEN

#
echo "Danh sach cac thu muc other co quyen ghi: "
sudo find / -type d -perm /o=w

echo "Danh sach cac ung dung da duoc cai:"
apt list --installed
