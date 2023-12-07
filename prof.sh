#!/bin/bash

profile_prefix="sudo $(which vtune) -collect hpc-performance"
#profile_prefix="sudo $(which vtune) -collect threading"
report_prefix="sudo $(which vtune) -report top-down -format=csv -csv-delimiter=','"
result_dir=./profile/cc
graph=/local/bench/gaps/GAP-web/GAP-web.mtx

## CC
# synthetic graph
#$profile_prefix -result-dir $result_dir -- ./cc -g10 -n10
# real graph
#$profile_prefix -result-dir $result_dir -- ./cc -f $graph

## report
$report_prefix -r $result_dir -report-output out.csv
