#include <iostream>
#include <vector>
#include <algorithm>

typedef unsigned long long vtype;
static void solve ()
{
    int N;
    std::cin >> N;
    std::vector<vtype> S(N);
    vtype s = 0;
    for (int i=0; i<N; ++i) {
        std::cin >> S[i];
        s+=S[i];
    }
    s/=2;
    std::sort(S.begin(), S.end());
    const vtype mx = 1<<N;
    for (vtype x = 1; x<mx; ++x) {
        std::vector<vtype> a;
        vtype A = 0;
        std::vector<vtype> b;
        {
            vtype d = 1;
            for (int i=0; d<=x; d<<=1,++i) {
                const vtype s = S[i];
                if (x&d) {
                    a.push_back(s);
                    A += s;
                }
                else {
                    b.push_back(s);
                }
            }
        }
        if (A>s) {
            continue;
        }
        const vtype mxb = 1<<b.size();
        for (vtype xb = 1; xb<mxb; ++xb) {
            vtype B = 0;
            vtype d = 1;
            std::vector<vtype> b2;
            for (int i=0; d<=xb; d<<=1,++i) {
                if (xb&d) {
                    B += b[i];
                    b2.push_back(b[i]);
                }
            }
            if (A==B) {
                for (int i=0; i<a.size(); ++i) {
                    if (i!=0) {
                        std::cout << " ";
                    }
                    std::cout << a[i];
                }
                std::cout << "\n";
                for (int i=0; i<b2.size(); ++i) {
                    if (i!=0) {
                        std::cout << " ";
                    }
                    std::cout << b2[i];
                }
                std::cout << "\n";
                return;
            }
        }
    }
    std::cout << "Impossible\n";
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
