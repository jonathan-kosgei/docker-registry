#!/bin/bash

password=`htpasswd -nbB -C 5 $1 $2 | awk -F: '{print $2}'`