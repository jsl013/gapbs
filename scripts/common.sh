#!/bin/bash

for bench in kron road twitter urand web; do
  python parse.py --bench $bench
done
