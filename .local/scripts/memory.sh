#!/bin/bash



free -h | sed -n '/Mem/p' | sed 's/Ki/K/g;s/Mi/M/g;s/Gi/G/g;s/Ti/T/g' | awk '{print " ", $3, "/",$2}'

