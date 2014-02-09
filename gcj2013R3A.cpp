#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>

static auto solve = []()
{
    enum{ R=37 };
    long long B,N; std::cin >> B >> N;
    std::vector<long long> X(N);
    for(auto& v: X) std::cin >> v;
    X.resize(R,0);
    std::sort(X.begin(),X.end());
    X.push_back(X.back()+B+1);
    double p=0;
    for(int i=1; i<=R; ++i)
    {
        for(int j=i; j<=R; ++j)
        {
            const auto s = std::accumulate(X.begin(),X.begin()+j,0ll);
            const auto h = std::min((B-(j-i)+s)/j,X[j]-1);
            if(h<=0 || h<X[i-1] || h+1<X[j-1])
                continue;
            const auto u = h*i-std::accumulate(X.begin(),X.begin()+i,0ll);
            const auto d = (h+1)*(j-i)-std::accumulate(X.begin()+i,X.begin()+j,0ll);
            p=std::max(p,u*(R-1.0)/i-u-d);
        }
    }
    return p;
};

int main()
{
    std::cout << std::fixed;
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
