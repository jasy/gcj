#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

def solve( R, k, N, g ):
    c = 0
    n = 0
    d = False
    nl = [[-1,-1] for x in range(N)]
    i = 0
    while i < R:
        if not d:
            p = nl[n][0]
            if p != -1:
                r = R-i
                t = i-p
                s = r / t
                c = c + (c-nl[n][1]) * s
                i = i + t * s
                d = True
                continue
            nl[n][0] = i
            nl[n][1] = c
        l = 0
        for j in range(N):
            ln = l+g[0]
            if ln > k:
                break
            l = ln
            n = n+1
            g.append(g.pop(0))
        c = c+l
        n = n%N
        i = i+1
    return c

def main():
    T = int(sys.stdin.readline())
    for x in range(T):
        R, k, N = map(int,sys.stdin.readline().split())
        g = map(int,sys.stdin.readline().split())
        print( "Case #" + str(x+1) + ": " + str(solve(R,k,N,g)) )

if __name__ == '__main__':
  main()
