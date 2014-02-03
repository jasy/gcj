#!/usr/bin/env python
import sys

def solve():
    n = int(sys.stdin.readline())
    ab = sorted(map(lambda _: map(int,sys.stdin.readline().split()),range(n)))
    return sum(map(lambda i: len(filter(lambda x: ab[i][1]>x[1],ab[i:])),range(n)))

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
