#!/bin/bash

opt=static
for bench in kron road twitter urand web; do
  python parse.py --bench $bench --opt $opt
done
