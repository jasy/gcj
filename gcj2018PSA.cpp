#include <iostream>
#include <string>

static void solve() {
    int A,B; std::cin >> A >> B;
    std::string r; std::cin >> r;
    std::cerr << A << ',' << B << std::endl;
    while(A!=B) {
        auto m=(A+B+1)/2;
        std::cout << m << std::endl;
        std::cin >> r;
        std::cerr << m << ':' << r << std::endl;
        switch(r[4]){
        case 'B': B=m-1; break;
        case 'S': A=m; break;
        default: return;
        }
    }
}

int main() {
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i) solve();
}
