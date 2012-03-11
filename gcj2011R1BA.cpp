#include <iostream>
#include <vector>
#include <map>

static void solve() {
    int N;
    std::cin >> N;
    std::vector<std::vector<int> > n(N);
    std::vector<int> nw(N);
    std::vector<int> na(N);
    std::vector<std::map<int, int> > nr(N);
    std::vector<double> WP(N);
    std::vector<double> OWP(N);
    std::vector<double> OOWP(N);
    for (int i=0; i<N; ++i) {
        int w=0;
        int a=0;
        for (int j=0; j<N; ++j) {
            char c;
            std::cin >> c;
            if ('.'!=c) {
                if ('1'==c) {
                    ++w;
                }
                ++a;
                nr[i][j]=('1'==c);
                n[i].push_back(j);
            }
        }
        nw[i]=w;
        na[i]=a;
        WP[i]=(double)w/a;
    }
    for (int i=0; i<N; ++i) {
        double owp=0;
        const int len = (int)n[i].size();
        for (int j=0; j<len; ++j) {
            const int t = n[i][j];
            const int r = nr[t][i];
            owp += (double)(nw[t]-r)/(na[t]-1);
        }
        OWP[i]=owp/len;
    }
    for (int i=0; i<N; ++i) {
        double oowp=0;
        const int len = (int)n[i].size();
        for (int j=0; j<len; ++j) {
            oowp += OWP[n[i][j]];
        }
        OOWP[i]=oowp/len;
    }
    for (int i=0; i<N; ++i) {
        std::cout << 0.25 * WP[i] + 0.50 * OWP[i] + 0.25 * OOWP[i] << "\n";
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
