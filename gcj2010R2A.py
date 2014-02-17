#!/usr/bin/env python

def solve((k,K,d)):
    def dist(i): return abs(k-(i+1))
    def elegant(i,j):
        def inside(i,j): return 0<=i and i<K and dist(i)<=j and j<K-dist(i)
        for x,y in [(x,y) for x in range(K) for y in range(dist(x),K-dist(x))]:
            for x1,y1 in [(x,j*2-y),(i*2-x,y)]:
                if inside(x1,y1) and d[x][y]!=d[x1][y1]:
                    return False
        return True
    def diff(i,j): return (k+sum(map(dist,[i,j])))**2-k**2
    return min([diff(i,j) for i in range(K) for j in range(K) if elegant(i,j)])

if __name__ == '__main__':
    import sys
    from multiprocessing import Pool
    def getin():
        k = int(sys.stdin.readline())
        K = k*2-1
        return (k,K,[sys.stdin.readline().rstrip() for _ in range(K)])
    xs = [getin() for _ in range(int(sys.stdin.readline()))]
    for i,x in enumerate(Pool().imap(solve,xs)):
        print("Case #"+str(i+1)+": "+str(x))
