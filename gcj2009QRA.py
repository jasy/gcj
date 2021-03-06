#!/usr/bin/env python
import sys
import string
import re

def solve(d):
    w = sys.stdin.readline().rstrip()
    r = re.compile(w.translate(string.maketrans("()","[]")))
    return len(filter(r.match,d))

L,D,N = map(int,sys.stdin.readline().split())
d = map(lambda x: sys.stdin.readline().rstrip(),range(D))
for x in range(N):
    print("Case #"+str(x+1)+": "+str(solve(d)))
