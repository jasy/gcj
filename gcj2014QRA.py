#!/usr/bin/env python
import sys

def solve():
    n1 = int(sys.stdin.readline())
    a1 = [map(int,sys.stdin.readline().split()) for _ in range(4)]
    n2 = int(sys.stdin.readline())
    a2 = [map(int,sys.stdin.readline().split()) for _ in range(4)]
    u = set(a1[n1-1]).intersection(set(a2[n2-1]))
    if len(u) < 1:
        return "Volunteer cheated!"
    if len(u) > 1:
        return "Bad magician!"
    return list(u)[0]

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
