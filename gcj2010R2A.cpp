#include <iostream>
#include <vector>
#include <string>
#include <limits>

static auto solve = []()
{
    int k; std::cin >> k;
    const auto K = 2*k-1;
    { std::string t; std::getline(std::cin,t); }
    std::vector<std::string> d(K);
    for(auto& v: d) std::getline(std::cin,v);
    static auto inside = [&](const int x, const int y)
    {
        const auto yb=std::abs(k-(x+1)), ye=K-yb;
        return (0<=x && x<K) && (yb<=y && y<ye);
    };
    static auto elegant = [&](const int i, const int j)
    {
        for(int x=0; x<K; ++x)
        {
            for(int y=0; y<K; ++y)
            {
                if(inside(x,y))
                {
                    const auto x1=i*2-x, y1=j*2-y;
                    if( (inside(x,y1) && d[x][y]!=d[x][y1]) ||
                        (inside(x1,y) && d[x][y]!=d[x1][y]) )
                        return false;
                }
            }
        }
        return true;
    };
    int n = std::numeric_limits<int>::max();
    for(int i=0; i<K; ++i)
    {
        for(int j=0; j<K; ++j)
        {
            if(elegant(i,j))
            {
                const int d = std::abs(k-(i+1))+std::abs(k-(j+1));
                n=std::min(n,(k+d)*(k+d)-k*k);
            }
        }
    }
    return n;
};

int main()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
