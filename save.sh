#!/bin/bash

CURRENT_DATE=`date +"%Y-%m-%d %T"`

git add .
git commit -m "Save fecha: $CURRENT_DATE"
git push -u origin main

exit 0
