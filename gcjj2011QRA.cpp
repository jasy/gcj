#include <iostream>
#include <vector>

static int solve (const int M, const int c, const int w, const std::vector<int>& A, const std::vector<int>& B)
{
    if (c<=0) {
        return w;
    }
    else if (w<=B[c-1]) {
        return solve(M, c-1, A[c-1]+w-1, A, B);
    }
    else if (A[c-1]+B[c-1]-1<w) {
        return solve(M, c-1, w, A, B);
    }
    else {
        return solve(M, c-1, w-B[c-1], A, B);
    }
}

static int solve ()
{
    int M,C,W;
    std::cin >> M >> C >> W;
    std::vector<int> A(C);
    std::vector<int> B(C);
    for (int i=0; i<C; ++i) {
        std::cin >> A[i] >> B[i];
    }
    return solve(M, C, W, A, B);
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

