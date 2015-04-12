#!/usr/bin/env python

def solve((D,P)):
    m = max(P)
    for i in range(1,m):
        c = 0
        for v in P:
            c = c+(v+i-1)//i-1
        m = min(m,i+c)
    return m

if __name__=='__main__':
    from sys import stdin
    def analyze(i):
        return (int(stdin.readline()),map(int,stdin.readline().split()))
    xs = map(analyze,range(int(stdin.readline())))
    from multiprocessing import Pool
    for i,v in enumerate(Pool().imap(solve,xs)):
        print("Case #"+str(i+1)+": "+str(v))
