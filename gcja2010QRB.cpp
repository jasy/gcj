#include <iostream>
#include <vector>
#include <string>
#include <sstream>

static auto solve = []()
{
    std::string s;
    std::getline(std::cin,s);
    std::vector<std::string> w;
    std::istringstream iss(s);
    std::istream_iterator<std::string> isi(iss);
    std::copy(isi,std::istream_iterator<std::string>(),std::back_inserter(w));
    std::ostringstream oss;
    for(int i=w.size()-1; i>=0; --i)
    {
        oss << w[i];
        if(i>0) oss << ' ';
    }
    return oss.str();
};

int main ()
{
    int T; std::cin >> T >> std::ws;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << "\n";
}
