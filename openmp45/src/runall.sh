#!/bin/bash
#
# By Chunhua Liao, August 7,2005

# 0. set up output file name and redirect stdout to it
OUTPUT=myoutput.$(date +%Y%m%d-%H%M%S)
touch $OUTPUT
exec 6>&1
exec >> $OUTPUT
# 1. set different thread number
#for var in 1 2 4 6 8; do
#for var in 1  2 4 8 16  18  32  36  64  72; do

#  OMP_NUM_THREADS=$var
#  export OMP_NUM_THREADS

#  echo //////////////////////////
#  echo set OpenMP threads to be  "$var"
#  echo //////////////////////////

# 2.  18 data points
for size in {16..256..16}  
  do
#    echo ////////////////////////
#    echo Iput size: "$size" 
#    echo ///////////////////////
# 3. run x times for each condition
# no need to run several times: the application is already iterative. generating lots of data for same training configuration    
#  for var2 in 1 2 3; do
#    echo ////////////////////////
#    echo run for the "$var2" time
#    echo ///////////////////////
#  date
# time ./a.out 

    ./miniFE.x -nx $size -ny $size -nz $size

# done

  done

#done

#restore stdout
exec 1>&6 6>&-
