#!/bin/bash

for opt in static dyn stat_dyn; do
cp src/cc/cc_${opt}.cc src/cc.cc
log_dir=log
mkdir -p $log_dir
for ((i=12; i <=20; i++)); do
  cp src/config/config_$i.h src/config.h
  make clean && make -j
for bench in kron road twitter urand web; do
  echo "$bench,$i"
  base=$log_dir/$opt
  log=$base/${bench}.out
  mkdir -p $base
  echo "$bench,$i" >> $log
  ./cc -f benchmark/graphs/$bench.sg -n32 >> $log
  echo "" >> $log
done
done
done
