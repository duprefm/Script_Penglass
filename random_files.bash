#! /bin/bash
s=$(hostname).$(pwd).${RANDOM}
for n in {1..20}; do
    x=$( printf %04d "$n" )
    dd if=/dev/urandom of=$(echo "${x}.$(date +%s).${s}" | sha256sum -z | awk '{print $1}')$( printf %03d "$n" ).bin bs=1 count=1048576
done