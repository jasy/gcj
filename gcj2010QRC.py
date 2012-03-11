#!/usr/local/bin/python
# -*- coding: utf-8 -*-

import sys

def solve( R, k, N, g ):
    c = 0
    for i in range(R):
        l = 0
        for j in range(N):
            ln = l+g[0]
            if ln > k:
                break
            l = ln
            g.append(g.pop(0))
        c = c+l
    return c

def main():
    T = int(sys.stdin.readline())
    for x in range(T):
        R, k, N = map(int,sys.stdin.readline().split())
        g = map(int,sys.stdin.readline().split())
        print( "Case #" + str(x+1) + ": " + str(solve(R,k,N,g)) )

if __name__ == '__main__':
  main()
