#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
static std::string solve(){
    int N; std::cin >> N;
    std::vector<int> V(N);
    for(auto&v:V) std::cin >> v;
    std::vector<int> s[2];
    for(auto&a:s) a.reserve((N+1)/2);
    for(int i=0; i<N; ++i) s[i&1].push_back(V[i]);
    for(auto&a:s) std::sort(a.begin(),a.end());
    for(int i=0; i<N-1; ++i)
        if(s[i&1][i/2]>s[1-(i&1)][(i+1)/2])
            return std::to_string(i);
    return "OK";
}
int main(){
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
