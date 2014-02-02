#!/usr/bin/env python
import sys
import operator

def solve():
    n = int(sys.stdin.readline())
    x = map(int,sys.stdin.readline().split())
    y = map(int,sys.stdin.readline().split())
    return sum(map(operator.mul,sorted(x),reversed(sorted(y))))

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
