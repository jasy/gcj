#!/usr/bin/env python
import sys

def solve():
    return " ".join(reversed(sys.stdin.readline().split()))

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
