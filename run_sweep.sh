#!/bin/bash

mkdir -p log
for ((i=12; i <=20; i++)); do
  cp src/config/config_$i.h src/config.h
  make clean && make -j
for bench in kron road twitter urand web; do
  echo "$bench,$i"
  base=log/pr
  log=$base/${bench}_static.out
  mkdir -p $base
  echo "$bench,$i" >> $log
  #./cc -f benchmark/graphs/$bench.sg -n64 >> log/${bench}_static.out
  ./pr -f benchmark/graphs/$bench.sg -n64 >> $log
  echo "\n" >> $log
done
done
