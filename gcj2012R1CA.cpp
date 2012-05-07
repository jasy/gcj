#include <iostream>
#include <string>
#include <vector>
#include <set>

static bool solve (std::set<int>& c, const std::vector<std::vector<int> >& M, const std::vector<int>& m)
{
    const int n = m.size();
    for (int i=0; i<n; ++i) {
        if (c.count(m[i])) {
            return true;
        }
        c.insert(m[i]);
        if (solve(c, M, M[m[i]])) {
            return true;
        }
    }
    return false;
}

static std::string solve ()
{
    int N;
    std::cin >> N;
    std::vector<std::vector<int> > M(N+1);
    for (int i=1; i<=N; ++i) {
        int n;
        std::cin >> n;
        for (int j=0; j<n; ++j) {
            int x;
            std::cin >> x;
            M[i].push_back(x);
        }
    }
    for (int i=1; i<=N; ++i) {
        std::set<int> c;
        if( solve(c, M, M[i]) ) {
            return "Yes";
        }
    }
    return "No";
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
