#include <iostream>
#include <vector>
#include <algorithm>

static long long solve ()
{
    int N;
    long long K;
    std::cin >> N >> K;
    std::vector<std::pair<int,std::pair<long long,long long> > > C;
    for (int i=0; i<N; ++i) {
        long long c;
        long long t;
        int s;
        std::cin >> c >> t >> s;
        C.push_back(std::make_pair(s, std::make_pair(c, t)));
    }
    std::sort(C.begin(), C.end());
    std::vector<std::pair<long long,long long> > z;
    long long S=0;
    for (int i=N-1; i>=0; --i) {
        long long c = C[i].second.first;
        long long t = C[i].second.second;
        const int s = C[i].first;
        for (int j=z.size()-1; j>=0; --j) {
            const long long zs = z[j].first;
            const long long ze = z[j].second;
            if (t>ze) {
                const long long d = t-ze;
                if (d>c) {
                    break;
                }
                else {
                    z[j].second = t;
                    c-=d;
                    t=zs-1;
                    S+=s*d;
                }
            }
            else if (t>=zs) {
                t=zs-1;
            }
        }
        if (t>0) {
            c = std::min(c, t);
            S+=s*c;
            z.push_back(std::make_pair(t-c+1, t));
            std::sort(z.begin(), z.end());
        }
    }
    return S;
}

int main ()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << "\n";
    }
    return 0;
}
