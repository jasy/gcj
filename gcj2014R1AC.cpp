#include <iostream>
#include <vector>
#include <algorithm>
#include <cassert>

static constexpr int N = 1000;

static std::vector<std::vector<double>> prepare()
{
    std::vector<std::vector<double>> dp(N,std::vector<double>(N));
    for(int i=0; i<N; ++i)
        dp[i][i] = 1;
    for(int i=0; i<N; ++i)
    {
        std::vector<std::vector<double>> dpn(N,std::vector<double>(N));
        for(int j=0; j<N; ++j)
            for(int k=0; k<N; ++k)
            {
                if(k!=i)
                {
                    dpn[j][k] += dp[j][k]*((N-1.0)/N);
                    dpn[j][i] += dp[j][k]*(1.0/N);
                }
                else
                {
                    for(int l=0; l<N; ++l)
                        dpn[j][l] += dp[j][k]*(1.0/N);
                }
            }
        dp.swap(dpn);
    }
    return dp;
}

int main()
{
    const auto P = prepare();
    int T; std::cin >> T;
    std::vector<double> r(T);
    for(auto& v: r)
    {
        int N_; std::cin >> N_;
        assert(N==N_);
        std::vector<int> a(N);
        for(auto& v: a) std::cin >> v;
        for(int j=0; j<N; ++j)
            v += P[a[j]][j];
    }
    auto t = r;
    std::sort(t.begin(),t.end());
    const auto u = t[T/2];
    for(int i=0; i<T; ++i)
        std::cout << "Case #" << i+1 << ": " << (r[i]<=u? "GOOD": "BAD") << '\n';
}
