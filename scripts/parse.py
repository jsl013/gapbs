import os
import numpy as np
import argparse
import pandas as pd


parser = argparse.ArgumentParser(description='parsing script')
parser.add_argument('--bench', type=str, required=True)
args = parser.parse_args()

os.system(f"cat ../log/{args.bench}_static.out | grep \"Average\" > tmp.csv")
tmp = open("tmp.csv", "r")
lines = tmp.readlines()

results = {"log": [], "latency": []}
log = 12
for l in lines:
    words = l.split()
    latency = float(words[2])
    results["log"].append(log)
    results["latency"].append(latency)
    log += 1

df = pd.DataFrame(results)
df.to_excel(f"csv/{args.bench}_static.xlsx")
