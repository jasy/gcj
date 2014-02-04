#!/usr/bin/env python
import sys

def dirList(n):
    s = []
    for x in map(lambda _: sys.stdin.readline().rstrip(),range(n)):
        d = x.split('/')
        s = s+map(lambda i: "/".join(d[:i]), range(2,len(d)+1))
    return set(s)

def solve():
    N,M = map(int,sys.stdin.readline().split())
    ns = dirList(N)
    ms = dirList(M)
    return len(ms-ns)

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
