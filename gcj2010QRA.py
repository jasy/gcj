#!/usr/bin/env python
import sys

def solve():
    N,K = map(int,sys.stdin.readline().split())
    b = (1<<N)-1
    return "ON" if (K&b)==b else "OFF"

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
