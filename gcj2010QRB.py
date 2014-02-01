#!/usr/bin/env python
import sys
import fractions

def solve():
    t = sorted(set(map(long,sys.stdin.readline().split()[1:])))
    g = reduce(fractions.gcd,map(lambda x: x-t[0],t[1:]))
    return (g-t[0]%g)%g

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
