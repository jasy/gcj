#include <iostream>
#include <iomanip>
#include <sstream>
#include <vector>

static auto solve = []()
{
    int W,L,U,G;
    std::cin >> W >> L >> U >> G;
    std::vector<std::pair<int,int>> lb(L);
    for(auto& v: lb) std::cin >> v.first >> v.second;
    std::vector<std::pair<int,int>> ub(U);
    for(auto& v: ub) std::cin >> v.first >> v.second;
    static auto area = [&](const double w)
    {
        double s=0;
        for(int i=0; i<L-1; ++i)
        {
            const double x1=lb[i].first, y1=lb[i].second;
            const double x2=lb[i+1].first, y2=lb[i+1].second;
            if(x2>=w)
            {
                const auto h = y1+(y2-y1)*(w-x1)/(x2-x1);
                s-=(w-x1)*(y1+h)/2.0;
                break;
            }
            s-=(x2-x1)*(y1+y2)/2.0;
        }
        for(int i=0; i<U-1; ++i)
        {
            const double x1=ub[i].first, y1=ub[i].second;
            const double x2=ub[i+1].first, y2=ub[i+1].second;
            if(x2>=w)
            {
                const auto h = y1+(y2-y1)*(w-x1)/(x2-x1);
                s+=(w-x1)*(y1+h)/2.0;
                break;
            }
            s+=(x2-x1)*(y1+y2)/2.0;
        }
        return s;
    };
    const auto all = area(W);
    std::vector<double> p(G,0.0);
    for(int i=1; i<G; ++i)
    {
        const auto a = all*i/G;
        double lo=p[i-1], hi=W;
        for(int j=0; j<50; ++j)
        {
            const auto mi = (lo+hi)/2;
            if(area(mi)<=a) lo=mi;
            else hi=mi;
        }
        p[i]=lo;
    }
    std::ostringstream oss;
    oss << std::fixed;
    for(int i=1; i<G; ++i)
        oss << '\n' << p[i];
    return oss.str();
};

int main()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
