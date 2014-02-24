#!/usr/bin/env python
import sys

def solve():
    r,t = map(int,sys.stdin.readline().split())
    lo,hi = 0, r+t+1
    while lo+1<hi:
        m = (lo+hi)/2
        if 2*m*r+2*m*m-m>t: hi=m
        else: lo=m
    return lo

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
