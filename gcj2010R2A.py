#!/usr/bin/env python
import sys

def solve():
    k = int(sys.stdin.readline())
    K = k*2-1
    d = map(lambda _: sys.stdin.readline().rstrip(),range(K))
    def dist(i): return abs(k-(i+1))
    def elegant(i,j):
        def inside(i,j): return 0<=i and i<K and dist(i)<=j and j<K-dist(i)
        for x,y in [(x,y) for x in range(K) for y in range(K) if inside(x,y)]:
            for x1,y1 in [(x,j*2-y),(i*2-x,y)]:
                if inside(x1,y1) and d[x][y]!=d[x1][y1]:
                    return False
        return True
    def diff(i,j): return (k+sum(map(dist,[i,j])))**2-k**2
    return min([diff(i,j) for i in range(K) for j in range(K) if elegant(i,j)])

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
