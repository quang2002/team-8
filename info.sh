#!/bin/bash

# ten may
HOSTNAME=`hostname`
echo "Ten may: $HOSTNAME"

# ban phan phoi, phien ban
info=$(cat /etc/*-release)
for i in ${info[@]}; do

    IFS='="'
    read -ra ADDR <<< "$i"

    case ${ADDR[0]} in
        DISTRIB_ID)
            echo "Phien ban phan phoi: ${ADDR[1]}"
            ;;
        DISTRIB_RELEASE)
            echo "Phien ban he dieu hanh: ${ADDR[1]}"
            ;;
    esac
done

# thong tin phan cung
info=$(cat /proc/cpuinfo)
IFS=$'\n'
for i in ${info[@]}; do
    IFS=':'
    read -ra ADDR <<< "$i"
    ADDR=`echo ${ADDR[0]} | xargs`
    case ${ADDR[0]%%*( )} in
        "model name")
            echo "Ten CPU: ${ADDR[1]}"
            ;;
        "cpu MHz")
            echo "Toc do: ${ADDR[1]} MHz"
            ;;
        "clflush size")
            echo "CPU Bit: ${ADDR[1]} bit"
            break
            ;;
    esac
done

# cat /proc/meminfo
info=$(cat /proc/meminfo)
IFS=$'\n'
for i in ${info[@]}; do
    IFS=':'
    read -ra ADDR <<< "$i"
    ADDR[0]=`echo ${ADDR[0]} | xargs`
    ADDR[1]=`echo ${ADDR[1]} | xargs`
    let ADDR[1]=`echo ${ADDR[1]:0:-2}`/1024

    case ${ADDR[0]%%*( )} in
        "MemTotal")
            echo "Thong tin bo nho vat li (tong bao nhieu MB): ${ADDR[1]} MB"
            break
            ;;
    esac
done


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

