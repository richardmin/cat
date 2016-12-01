#!/bin/bash

cd ~/cat/load_tests
tsung -n -f $0  start
if [ $? -eq 0 ]; then
    cd /home/ec2-user/.tsung/log
    cd $( ls -1 | tail -1 )
    tsung_stats.pl
    echo "success"
else
    echo "fail"
fi