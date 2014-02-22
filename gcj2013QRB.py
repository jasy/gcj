#!/usr/bin/env python
import sys

def solve():
    N,M = map(int,sys.stdin.readline().split())
    a = [map(int,sys.stdin.readline().split()) for _ in range(N)]
    c = map(max,a)
    r = map(max,zip(*a))
    p = all(map(lambda x,ai: all(map(lambda y,aij: aij>=min(x,y),r,ai)),c,a))
    return "YES" if p else "NO"

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
