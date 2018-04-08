#include <iostream>
#include <iomanip>
#include <limits>
static double solve(){
    double D;
    int N;
    std::cin >> D >> N;
    double v=std::numeric_limits<double>::max();
    for(int i=0; i<N; ++i){
        double K,S; std::cin >> K >> S;
        v=std::min(v,D*S/(D-K));
    }
    return v;
}
int main(){
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    std::cout << std::fixed << std::setprecision(6);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
