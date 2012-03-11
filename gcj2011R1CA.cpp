#include <iostream>
#include <string>
#include <vector>

static void solve() {
    int R,C;
    std::cin >> R >> C;
    std::vector<std::string> p(R);
    for (int i=0; i<R; ++i) {
        std::cin >> p[i];
    }
    for (int i=0; i<R; ++i) {
        bool e=false;
        for (int j=0; j<C; ++j) {
            if ('#'==p[i][j]) {
                if (!(i<R-1&&j<C-1)) {
                    e=true;
                    break;
                }
                if ('#'!=p[i][j+1]) {
                    e=true;
                    break;
                }
                if ('#'!=p[i+1][j]) {
                    e=true;
                    break;
                }
                if ('#'!=p[i+1][j+1]) {
                    e=true;
                    break;
                }
                p[i][j]='/';
                p[i][j+1]='\\';
                p[i+1][j]='\\';
                p[i+1][j+1]='/';
            }
        }
        if (e) {
            std::cout << "Impossible\n";
            return;
        }
    }
    for (int i=0; i<R; ++i) {
        std::cout << p[i] << "\n";
    }
}

int main ()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ":\n";
        solve();
    }
    return 0;
}
