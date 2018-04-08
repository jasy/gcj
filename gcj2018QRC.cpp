#include <iostream>
static void solve(){
    int A; std::cin >> A;
    unsigned b=0;
    const int t=(A+2)/3-1;
    int p=2;
    for(int i=1;;++i){
        std::cout << "2 " << p << std::endl;
        int x,y; std::cin >> x >> y;
        if(x<=0 || y<=0) break;
        b|=1u<<(x-1+(y-p+1)*3);
        while(p<t && (b&7)==7) ++p, b>>=3;
    }
}
int main(){
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i) solve();
}
