#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <regex>

static auto solve = [](const std::vector<std::string>& d)
{
    std::string w; std::cin >> w;
    for(auto& v: w)
        switch(v)
        {
        case '(': v='['; break;
        case ')': v=']'; break;
        default: break;
        }
    std::regex r(w);
    int c=0;
    for(auto& v: d)
        if(std::regex_match(v,r))
            ++c;
    return c;
};

int main()
{
    int L,D,N; std::cin >> L >> D >> N;
    std::vector<std::string> d(D);
    for(auto& v: d) std::cin >> v;
    for(int i=1; i<=N; ++i)
        std::cout << "Case #" << i << ": " << solve(d) << '\n';
}
