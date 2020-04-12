#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>
static void solve(){
    int N,B,F; std::cin >> N >> B >> F;
    std::cerr << "Case# " << N << ' ' << B << ' ' << F << '\n';
    std::string qs(N,'0');
    std::vector<bool> q(N);
    std::vector<int> g(N);
    std::vector<int> gp(N);
    int b = 1<<(sizeof(int)*8-__builtin_clz(B));
    for(int i=1; i<=F; ++i){
        for(int k=0; k<N; ++k) q[k]=(k%(b*2)<b)?0:1, qs[k]=q[k]+'0';
        std::cerr << 'Q' << i << ':' << qs << '\n';
        std::cout << qs << std::endl;
        std::string r; std::cin >> r;
        std::cerr << 'R' << i << ':' << r << '\n';
        if(r=="-1") exit(-2);
        if(i==1){
            bool c=false;
            size_t p=0;
            for(int j=0; j*b<N; ++j){
                int s=0;
                for(int k=j*b; k<std::min((j+1)*b,N); ++k){
                    if(p>=r.size() || (r[p]!='0')!=c) break;
                    ++p;
                    ++s;
                }
                g[j]=s;
                c=!c;
            }
        }
        else{
            size_t p=0;
            for(int j=0; j*b*2<N; ++j){
                g[j*2]=0;
                g[j*2+1]=0;
                for(int k=0; k<gp[j]; ++k)
                    ++g[j*2+(r[p++]!='0'?1:0)];
            }
        }
        if(b<=1) break;
        b>>=1;
        std::swap(g,gp);
    }
    std::cerr << "A:";
    for(int i=0; i<N; ++i) if(g[i]==0) std::cerr << i << ' ';
    std::cerr << '\n';
    for(int i=0; i<N; ++i) if(g[i]==0) std::cout << i << ' ';
    std::cout << std::endl;
    int e; std::cin >> e;
    if(e==-1) exit(-1);
}
int main(){
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i) solve();
}
