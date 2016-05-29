#include <iostream>
#include <string>
#include <limits>

static bool check(const std::string& s, int v, const int N)
{
    for(int i=N-1; i>=0; --i,v/=10)
        if(s[i]!='?' && s[i]-'0'!=v%10)
            return false;
    return true;
}

static auto solve()
{
    std::string C,J;
    std::cin >> C >> J;
    const int N = C.size();
    int b = 1;
    int m=std::numeric_limits<int>::max();
    int m1=0,m2=0;
    for(int i=0; i<N; ++i) b*=10;
    for(int v1=0; v1<b; ++v1)
        if(check(C,v1,N))
            for(int v2=0; v2<b; ++v2)
                if(check(J,v2,N))
                    if(std::abs(v1-v2)<m)
                        m=std::abs(v1-v2), m1=v1, m2=v2;
    for(int i=0; i<N; ++i)
        C[N-i-1] = m1%10+'0', m1/=10,
        J[N-i-1] = m2%10+'0', m2/=10;
    return C+" "+J;
}

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
