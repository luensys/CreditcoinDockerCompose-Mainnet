#!/bin/bash

servers="js1 sm1 jy1 kd1 wk1 jh1 jk1"

for s in $servers
do
    echo -n "$s: "
    scp $1 $s:$2
done