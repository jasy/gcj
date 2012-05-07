#include <iostream>
#include <vector>
#include <algorithm>

static long long solve (const int ia, const int ib, const std::vector<long long>& a, const std::vector<int>& A, std::vector<long long>& b, const std::vector<int>& B)
{
    if (ia >= A.size() || ib >= B.size()) {
        return 0;
    }
    long long c = solve(ia+1,ib,a,A,b,B);
    long long m = 0;
    long long r = a[ia];
    for (int i=ib; i<B.size(); ++i) {
        if (A[ia] == B[i]) {
            if (r<b[i]) {
                m += r;
                b[i]-=r;
                c = std::max(c, m+solve(ia+1, i, a, A, b, B));
                b[i]+=r;
                r = 0;
                break;
            }
            else {
                m += b[i];
                r -= b[i];
                c = std::max(c, m+solve(ia+1, i+1, a, A, b, B));
            }
        }
    }
    return c;
}

static long long solve ()
{
    int N,M;
    std::cin >> N >> M;
    std::vector<long long> a(N);
    std::vector<int> A(N);
    for (int i=0; i<N; ++i) {
        std::cin >> a[i] >> A[i];
    }
    std::vector<long long> b(M);
    std::vector<int> B(M);
    for (int i=0; i<M; ++i) {
        std::cin >> b[i] >> B[i];
    }
    return solve(0,0,a,A,b,B);
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
