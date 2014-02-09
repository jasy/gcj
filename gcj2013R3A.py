#!/usr/bin/env python
import sys

def solve():
    R = 37
    B,N = map(int,sys.stdin.readline().split())
    X = sorted(map(int,sys.stdin.readline().split())+[0]*(R-N))
    X.append(X[R-1]+B+1)
    p=0.0
    for i,j in [(i,j) for i in range(1,R+1) for j in range(i,R+1)]:
        h = min((B-(j-i)+sum(X[:j]))/j,X[j]-1)
        if h<=0 or h<X[i-1] or h+1<X[j-1]:
            continue
        u = h*i-sum(X[:i])
        d = (h+1)*(j-i)-sum(X[i:j])
        p=max(p,u*(R-1.0)/i-u-d)
    return "%.6f"%p

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
