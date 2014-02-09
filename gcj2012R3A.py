#!/usr/bin/env python
from sys import stdin
from operator import div

def solve():
    N = int(stdin.readline())
    L = map(float,stdin.readline().split())
    P = map(float,stdin.readline().split())
    t = reversed(sorted(zip(map(div,P,L),range(0,-N,-1))))
    return " ".join(map(lambda (x,y): str(-y),t))

for x in range(int(stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
