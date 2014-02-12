#!/usr/bin/env python
import sys

def solve():
    P = int(sys.stdin.readline())
    M = map(int,sys.stdin.readline().split())
    t = [map(int,sys.stdin.readline().split()) for _ in range(P)]
    INF = sum(map(sum,t))+1
    dp = [[0 if r>=P-M[i] else INF for r in range(P+1)] for i in range(1<<P)]
    for p in range(P):
        def cost(i,r):
            i1,i2 = i*2, i*2+1
            c1 = dp[i1][r]+dp[i2][r]
            c2 = dp[i1][r+1]+dp[i2][r+1]+t[p][i]
            return min(INF,c1,c2)
        dp = [[cost(i,r) for r in range(P-p)] for i in range(1<<(P-p-1))]
    return dp[0][0]

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
