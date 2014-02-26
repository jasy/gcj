#!/usr/bin/env python
import sys

def solve():
    ln = (sys.stdin.readline().split())
    L,M,N = ln[0], len(ln[0]), int(ln[1])
    def cnt((s,b,cc),(i,c)):
        if c in "aeiou": return (s,b,0)
        if cc<N-1: return (s,b,cc+1)
        return (s+(i-N-b+1)*(M-i),i-N+1,cc)
    return reduce(cnt,enumerate(L),(0,-1,0))[0]

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
