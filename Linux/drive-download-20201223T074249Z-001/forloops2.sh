#! /bin/bash

paths = ('/etc/shadow' '/etc/passwd')

for path in ${paths[@]};
do
	ls -l $path >> $output 
fi
done

$output  = ~/research/sys_info.txt
