#!/usr/bin/env python
import sys

def solve():
    C = int(sys.stdin.readline())
    I = int(sys.stdin.readline())
    P = map(int,sys.stdin.readline().split())
    c = [(v,[i+1,j+1]) for i in range(I) for j in range(i+1,I)
                       for v in [P[i]+P[j]] if v<=C]
    return " ".join(map(str,max(c)[1]))

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
