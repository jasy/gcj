#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

static auto solve = []()
{
    std::string A,S,T;
    std::cin >> A >> S >> T;
    int a=0;
    for(auto v: A)
        for(size_t i=0; i<S.size(); ++i)
            if(v==S[i])
                a=a*S.size()+i;
    std::string t;
    while(a)
    {
        t.push_back(T[a%T.size()]);
        a/=T.size();
    }
    std::reverse(t.begin(),t.end());
    return t;
};

int main ()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << "\n";
}
