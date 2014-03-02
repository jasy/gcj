#include <iostream>
#include <vector>
#include <sstream>

static auto solve = []()
{
    int C,I; std::cin >> C >> I;
    std::vector<int> P(I);
    for(auto& v: P) std::cin >> v;
    int m=-1, m1=-1, m2=-1;
    for(int i=0; i<I; ++i)
        for(int j=i+1; j<I; ++j)
        {
            const auto v = P[i]+P[j];
            if(m<v && v<=C)
                m=v, m1=i, m2=j;
        }
    std::ostringstream oss;
    oss << m1+1 << ' ' << m2+1;
    return oss.str();
};

int main ()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << "\n";
}
