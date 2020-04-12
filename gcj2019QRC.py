#!/usr/bin/env python3
from math import gcd
from string import ascii_uppercase

def solve():
    N,L=map(int,input().split())
    CP=list(map(int,input().split()))
    k=-1
    t=[-1]*(L+1)
    for i in range(L-1):
        a=CP[i]
        b=CP[i+1]
        if a==b: continue
        k=i+1
        t[k]=gcd(a,b)
        break
    d=t[k]
    for i in range(k,L):
        t[i+1]=d=CP[i]//d
    d=t[k]
    for i in range(k,0,-1):
        t[i-1]=d=CP[i-1]//d
    s=dict(zip(sorted(set(t)),ascii_uppercase))
    return "".join(map(lambda x: s[x],t))

for i in range(int(input())):
    print("Case #"+str(i+1)+": "+str(solve()))
