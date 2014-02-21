#!/usr/bin/env python
import sys

def solve():
    xs = [sys.stdin.readline().rstrip() for _ in range(5)][:4]
    def won(c):
        def line(w): return all([x in [c,'T'] for x in w])
        def lines(xs): return any(map(line,xs))
        def cross(xs):
            return [[xs[i][j] for i,j in enumerate(n)]
                    for n in [range(4),reversed(range(4))]]
        return any(map(lines,[xs,zip(*xs),cross(xs)]))
    if won('X'): return "X won"
    if won('O'): return "O won"
    if any(['.' in w for w in xs]): return "Game has not completed"
    return "Draw"

for x in range(int(sys.stdin.readline())):
    print("Case #"+str(x+1)+": "+str(solve()))
