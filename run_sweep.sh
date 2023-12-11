#!/bin/bash

#opt=static
for opt in static dyn; do
cp src/cc/cc_${opt}.cc src/cc.cc
mkdir -p log
for ((i=11; i <=20; i++)); do
  cp src/config/config_$i.h src/config.h
  make clean && make -j
for bench in kron road twitter urand web; do
  echo "$bench,$i"
  base=log/pr
  log=$base/${bench}_${opt}.out
  mkdir -p $base
  echo "$bench,$i" >> $log
  ./cc -f benchmark/graphs/$bench.sg -n64 >> $log
  #./pr -f benchmark/graphs/$bench.sg -n64 >> $log
  echo "" >> $log
done
done
done
