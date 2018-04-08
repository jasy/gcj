#include <iostream>
#include <string>
#include <vector>
#include <queue>

static std::string solve()
{
    int N; std::cin >> N;
    std::vector<int> P(N);
    for(auto&v:P) std::cin >> v;
    std::priority_queue<int> q;
    int t=0;
    for(int i=0; i<N; ++i){
        const auto v=P[i];
        t+=v;
        q.push((v<<8)|i);
    }
    std::string r; r.reserve((t+1)/2*3);
    if(t%2){
        const auto v=q.top(); q.pop();
        r+='A'+(v&255);
        if(v>=(2<<8)) q.push(v-(1<<8));
        r+=' ';
    }
    while(!q.empty()){
        for(int i=0; i<2; ++i){
            const auto v=q.top(); q.pop();
            r+='A'+(v&255);
            if(v>=(2<<8)) q.push(v-(1<<8));
        }
        r+=' ';
    }
    return r;
}

int main(){
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
