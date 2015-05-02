#include <iostream>
#include <vector>
#include <limits>

static auto solve()
{
    int R,C,N; std::cin >> R >> C >> N;
    if(N<=0) return 0;
    int m=std::numeric_limits<int>::max();
    for(unsigned b=0; b<(1<<R*C); ++b)
        if(__builtin_popcount(b)==N)
        {
            int c=0;
            for(int i=0; i<R; ++i)
                for(int j=1; j<C; ++j)
                    if((b&1<<(i*C+(j-1))) && (b&1<<(i*C+j))) ++c;
            for(int i=1; i<R; ++i)
                for(int j=0; j<C; ++j)
                    if((b&1<<((i-1)*C+j)) && (b&1<<(i*C+j))) ++c;
            m=std::min(m,c);
        }
    return m;
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
