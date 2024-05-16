#!/bin/bash

df -h | sed -n -e '199G' | awk '{print " ", $3, "/", $2}'
