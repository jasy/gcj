#include <iostream>
#include <vector>
#include <string>
#include <set>
#include <algorithm>
#include <sstream>

static auto solve = []()
{
    int M,N; std::cin >> M >> N;
    std::vector<std::string> S(M);
    for(auto& v: S) std::cin >> v;
    int mn = 1;
    for(int i=0; i<M; ++i)
        mn *= N;
    int m=0, c=0;
    std::vector<int> p(M);
    for(int b=0; b<mn; ++b)
    {
        auto a=b;
        std::vector<bool> s(N,false);
        for(int i=0; i<M; ++i)
            p[i]=a%N,a/=N,s[p[i]]=true;
        bool f=true;
        for(int i=0; i<N; ++i)
            if(!s[i]){ f=false; break; }
        if(!f) continue;
        std::vector<std::set<std::string>> ns(N);
        for(int i=0; i<M; ++i)
        {
            const auto n = p[i];
            const auto& v = S[i];
            const int L = v.size();
            for(int j=1; j<=L; ++j)
                ns[n].insert(v.substr(0,j));
        }
        int t=0;
        for(int i=0; i<N; ++i)
            t+=ns[i].size()+1;
        if(m<t) m=t, c=1;
        else if(m==t) ++c;
    }
    std::ostringstream oss;
    oss << m << ' ' << c;
    return oss.str();
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << std::endl;
}
