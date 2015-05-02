#include <iostream>
#include <vector>
#include <algorithm>

static auto solve()
{
    typedef long long T;
    T N; std::cin >> N;
    int n=0;
    T s=0;
    for(auto v=N; v; v/=10) ++n,s=s*10+9;
    s/=10;
    T c=0;
    while(n>1)
    {
        T m=1;
        for(int i=0; i<n/2; ++i) m*=10;
        T t=N-s;
        T r=N%m; N/=m;
        if(r==0) r+=m,--N;
        T v=0;
        while(N) v=v*10+N%10,N/=10;
        c += std::min(t,v+r+1);
        N=s;
        s/=10;
        --n;
    }
    return c+N;
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
