#!/usr/bin/env python
import sys

def solve():
    A,N = map(int,sys.stdin.readline().split())
    M = map(int,sys.stdin.readline().split())
    def f(a,n,m):
        if not m or a<=1: return n
        if a>m[0]: return f(a+m[0],n-1,m[1:])
        return min(n,f(a+a-1,n+1,m))
    return f(A,N,sorted(M))

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
