#!/usr/bin/env python
from itertools import dropwhile
def solve(n):
    l=len(n)
    n=map(lambda c: ord(c)-ord('0'),n)
    for i in range(l-1):
        if n[i]>n[i+1]:
            k=1
            for j in reversed(range(i+1)):
                if n[j]<=n[j+1]:
                    k=j+2
                    break
                n[j]=n[j]-1
            for j in range(k,l): n[j]=9
    return "".join(map(str,dropwhile(lambda v: v==0,n)))

if __name__=='__main__':
    def analyze(i): return raw_input()
    xs = map(analyze,range(int(raw_input())))
    from multiprocessing import Pool
    for i,v in enumerate(Pool().imap(solve,xs)):
        print("Case #"+str(i+1)+": "+str(v))
