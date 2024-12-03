#!/bin/bash

choice=$1
n=$2
criteria=$3

case $choice in
    topProcess)
        case $criteria in
            memory)
                ps aux --sort -%mem | head -n "$n"
                ;;
            cpu)
                ps aux --sort -%cpu | head -n "$n"
                ;;
            *)
                echo "Invalid criteria. Please specify 'memory' or 'cpu'."
                exit 1
                ;;
        esac
        ;;
    killLeastPriorityProcess)
        PID=$(ps -l --sort=pri | awk 'NR==2 {print $4}')
        kill -9 "$PID"
        ;;
    RunningDurationProcess)
        process=$3
        ps -o etime= -p "$process"
        ;;
    listOrphanProcess)
        ps -eo pid,ppid,cmd | awk '$2 == 1'
        ;;
    listZoombieProcess)
        ps aux | awk '$8=="Z"'
        ;;
    killProcess)
        process=$3
        kill -9 "$process"
        ;;
    ListWaitingProcess)
        ps aux | awk '$8=="D"'
        ;;
    *)
        echo "Invalid command"
        ;;
esac