#!/usr/bin/env python
import sys

def solve():
    M,V = map(int,sys.stdin.readline().split())
    G,L = (M-1)/2, (M+1)/2
    gate = [map(int,sys.stdin.readline().split()) for _ in range(G)]
    leaf = [int(sys.stdin.readline()) for _ in range(L)]
    dp = [[M,M] for _ in range(M)]
    for i,v in enumerate(leaf):
        dp[i+G][v]=0
    for i,(a,c) in reversed(list(enumerate(gate))):
        i1,i2 = i*2+1, i*2+2
        if a or c:
            for j in range(2):
                for k in range(2):
                    dp[i][j&k]=min(dp[i][j&k],dp[i1][j]+dp[i2][k]+1-a)
        if not a or c:
            for j in range(2):
                for k in range(2):
                    dp[i][j|k]=min(dp[i][j|k],dp[i1][j]+dp[i2][k]+a)
    return dp[0][V] if dp[0][V]<M else "IMPOSSIBLE"

for i in range(int(sys.stdin.readline())):
    print("Case #"+str(i+1)+": "+str(solve()))
