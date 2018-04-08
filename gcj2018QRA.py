#!/usr/bin/env python

def solve():
    D,P=raw_input().split();
    D=int(D)
    P=list(P)
    a=0
    b=0
    s=1
    for c in P:
        if c=='S':
            a=a+s
            b=b+1
        else:
            s=s*2
    if D<b: return "IMPOSSIBLE"
    m=0
    while D<a:
        t=s
        f=True
        for i in range(len(P)-1,0,-1):
            if P[i]!='S':
                t=t/2
            elif P[i-1]!='S':
                a=a-t/2
                P[i-1],P[i]=P[i],P[i-1]
                m=m+1
                f=False
                break
        if f: return "Bug: "+str(m)
    return m

for i in range(int(raw_input())):
    print("Case #"+str(i+1)+": "+str(solve()))
