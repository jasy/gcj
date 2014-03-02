#!/usr/bin/env python
import sys

def solve():
    A,S,T = sys.stdin.readline().split()
    N,M = len(S),len(T)
    a = reduce(lambda a,c: a*N+S.index(c),A,0);
    t = ""
    while a!=0:
        t=T[a%M]+t
        a=a//M
    return t

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
