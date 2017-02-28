#!/bin/sh -e

#Take a screenshot
now=$(date +"%b_%d_%Y_%H:%M:%S")
sleep 1
scrot -s ~/media/images/screen/$now"Cut".png
exit 0
