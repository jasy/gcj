#!/usr/bin/env python
import sys
import operator

def solve():
    cards = map(int,sys.stdin.readline().split()[1:])
    if not cards: return 0
    num = [0]*(max(cards)+2)
    for i in cards: num[i]=num[i]+1
    s,e = [],[]
    for i,(p,n) in enumerate(zip(num,num[1:])):
        if   p<n: s.extend([i]*(n-p))
        elif p>n: e.extend([i]*(p-n))
    return min(map(operator.sub,e,s))

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
