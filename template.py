#!/usr/bin/env python

def solve(i):
    return "%.6f" % i

if __name__=='__main__':
    def analyze(i):
        return 0.0
    xs = map(analyze,range(int(raw_input())))
    from multiprocessing import Pool
    for i,v in enumerate(Pool().imap(solve,xs)):
        print("Case #"+str(i+1)+": "+str(v))
