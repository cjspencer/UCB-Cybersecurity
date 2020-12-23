#!/bin/bash

list=('Hawaii' 'Georgia' 'Alabama' 'Nevada' 'California' 'Utah')

for i in ${list[@]};
do

   if [ $i == 'Hawaii' ];
   then
      echo 'Hawaii is the best'

   else
      echo 'I am not fond of Hawaii'
   fi
done
