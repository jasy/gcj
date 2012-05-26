#include <iostream>
#include <vector>
#include <algorithm>

static void solve ()
{
    int N, W, L;
    std::cin >> N >> W >> L;
    std::vector<std::pair<int, int> > r(N);
    for (int i=0; i<N; ++i) {
        std::cin >> r[i].first;
        r[i].second = i;
    }
    std::sort(r.begin(), r.end());
    std::reverse(r.begin(), r.end());
    std::vector<std::pair<int, int> > p(N);
    int l = 0;
    int ml = 0;
    int w = 0;
    for (int i=0; i<N; ++i) {
        const int n = r[i].first;
        int nw = w;
        int nl = l;
        if (nw != 0) {
            nw += n;
            w += 2*n;
            if (nw>W) {
                nw = 0;
                w = n;
                nl = l = ml;
            }
        }
        else {
            w += n;
        }
        if (nl != 0) {
            nl += n;
            ml = std::max(ml, l+2*n);
        }
        else {
            ml = std::max(ml, n);
        }
        p[r[i].second].first = nw;
        p[r[i].second].second = nl;
    }
    for (int i=0; i<N; ++i) {
        std::cout << " " << p[i].first << " " << p[i].second;
    }
}

int main ()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ":";
        solve();
        std::cout << "\n";
    }
    return 0;
}
