#!/usr/bin/env python
import sys

def solve():
    N,M,A = map(int,sys.stdin.readline().split())
    h = (A+N-1)//N
    return " ".join(map(str,[0,0,N,1,N*h-A,h])) if N*M>=A else "IMPOSSIBLE"

for i in range(int(sys.stdin.readline())):
    print("Case #"+str(i+1)+": "+str(solve()))
