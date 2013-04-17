#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

def next(keys,chest):
    k = chest[0]
    if not keys.has_key(k) or keys[k]<=0:
        return False
    keys[k]=keys[k]-1
    for i in chest[2:]:
        if keys.has_key(i):
            keys[i]=keys[i]+1
        else:
            keys[i]=1
    return True

def back(keys,chest):
    k = chest[0]
    keys[k]=keys[k]+1
    for i in chest[2:]:
        keys[i]=keys[i]-1;

def dfs(keys,chests,order,orderset,memo):
    if len(chests)==len(order):
        return True
    for i,chest in enumerate(chests):
        b = (1<<i)
        nos = orderset|b
        if orderset&b==0 and nos not in memo:
            if next(keys,chest):
                order.append(i)
                if dfs(keys,chests,order,nos,memo):
                    return True
                order.remove(i)
                back(keys,chest)
    memo.add(orderset)
    return False

def solve():
    K, N = map(int,sys.stdin.readline().split())
    keys = {}
    for i in map(int,sys.stdin.readline().split()):
        if keys.has_key(i):
            keys[i]=keys[i]+1
        else:
            keys[i]=1
    chests = []
    for i in range(N):
        chests.append(map(int,sys.stdin.readline().split()))
    order = []
    if dfs(keys,chests,order,0,set()):
        return " ".join(map(lambda x: str(x+1),order))
    return "IMPOSSIBLE"

def main():
    T = int(sys.stdin.readline())
    for x in range(T):
        print( "Case #" + str(x+1) + ": " + solve() )

if __name__ == '__main__':
    main()
