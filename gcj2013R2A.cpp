#include <iostream>
#include <vector>
#include <algorithm>

static const long long MOD = 1000002013;

inline static long long cost(const long long n){ return n*(n-1)/2%MOD; }

static long long solve()
{
    int N,M;
    std::cin >> N >> M;
    std::vector<std::pair<long,long>> op(M);
    std::vector<std::pair<long,long>> ep(M);
    long long s = 0;
    for(int i=0; i<M; ++i)
    {
        long long o,e,p;
        std::cin >> o >> e >> p;
        op[i].first = o;
        op[i].second = p;
        ep[i].first = e;
        ep[i].second = p;
        s=(s-cost(e-o)*p)%MOD;
    }
    std::sort(op.begin(),op.end());
    std::reverse(op.begin(),op.end());
    std::sort(ep.begin(),ep.end());
    for(auto& opv: op)
    {
        auto const o = opv.first;
        for(auto& epv: ep)
        {
            auto const e = epv.first;
            if(o<=e)
            {
                auto const p = std::min(opv.second,epv.second);
                opv.second-=p;
                epv.second-=p;
                s=(s+cost(e-o)*p)%MOD;
            }
        }
    }
    s=(s+MOD)%MOD;
    return s;
}

int main()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
    return 0;
}
