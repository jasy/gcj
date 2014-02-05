#!/usr/bin/env python
import sys

def solve():
    N = long(sys.stdin.readline())
    n = len(bin(N))-3
    return n+bin(N-(1<<n)+1).count('1')

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
