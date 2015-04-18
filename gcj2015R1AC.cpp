#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <limits>

static auto solve = []()
{
    int N; std::cin >> N;
    struct P{ int x,y; };
    std::vector<P> p(N);
    for(auto&v:p) std::cin >> v.x >> v.y;
    for(int i=0; i<N; ++i)
    {
        std::vector<double> a; a.reserve((N-1)*2);
        for(int j=0; j<N; ++j) if(j!=i) 
            a.emplace_back(atan2(p[j].y-p[i].y,p[j].x-p[i].x));
        std::sort(a.begin(),a.end());
        for(int j=0; j<N-1; ++j)
            a.emplace_back(a[j]+M_PI*2);
        int m=std::numeric_limits<int>::max();
        for(int j=0; j<N-1; ++j)
        {
            static const double EPS = 1e-10;
            auto it1 = std::upper_bound(a.begin(),a.end(),a[j]);
            auto it2 = std::lower_bound(a.begin(),a.end(),a[j]+M_PI-EPS);
            m = std::min<int>(m,std::distance(it1,it2));
        }
        std::cout << (N<=1?0:m) << '\n';
    }
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ":\n", solve();
}
