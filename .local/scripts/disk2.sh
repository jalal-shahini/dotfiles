#!/bin/bash

df -h | sed -n -e '\/dev\/nvm/p' | awk '{print " ", $3, "/", $2}'

