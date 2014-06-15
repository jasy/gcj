#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>

static auto solve = []()
{
    int N; std::cin >> N;
    std::vector<std::string> S(N);
    for(auto& v: S) std::cin >> v;
    char m1,m2;
    int M;
    {
        std::string a = std::accumulate(S.begin(),S.end(),std::string());
        m1=*std::min_element(a.begin(),a.end());
        m2=*std::max_element(a.begin(),a.end());
        M=a.size();
    }
    std::vector<int> idx(N);
    std::iota(idx.begin(),idx.end(),0);
    int n=0;
    do
    {
        std::string t;
        for(auto v: idx)
            t+=S[v];
        auto p = t[0];
        std::vector<bool> u(26,false);
        u[p-'a']=true;
        bool f=true;
        for(int i=1; i<M; ++i)
        {
            auto v = t[i];
            if(v!=p && u[v-'a'])
            {
                f=false;
                break;
            }
            p=v;
            u[v-'a']=true;
        }
        if(f)
            ++n;
    }while(std::next_permutation(idx.begin(),idx.end()));
    return std::to_string(n);
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << std::endl;
}
