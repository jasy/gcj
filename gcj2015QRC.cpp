#include <iostream>
#include <string>
#include <vector>
#include <cassert>

enum Q{
    Q_1,
    Q_i,
    Q_j,
    Q_k,
    Q_m1,
    Q_mi,
    Q_mj,
    Q_mk,
    Q_N = 4
};

static Q operator*(const Q q1, const Q q2)
{
    static const Q t[Q_N][Q_N] =
    {
        //  1,   i,   j,   k,
        { Q_1, Q_i, Q_j, Q_k}, //  1
        { Q_i,Q_m1, Q_k,Q_mj}, //  i
        { Q_j,Q_mk,Q_m1, Q_i}, //  j
        { Q_k, Q_j,Q_mi,Q_m1}, //  k
    };
    static auto Qflip = [](const Q q)->Q{ return Q(q^Q_N); };
    static auto Qabs = [](const Q q)->Q{ return Q(q&(Q_N-1)); };
    const auto v = t[Qabs(q1)][Qabs(q2)];
    const auto f = (q1&Q_m1) ^ (q2&Q_m1);
    return f? Qflip(v): v;
}

static Q cnv(char c)
{
    switch(c)
    {
    case 'i': return Q_i;
    case 'j': return Q_j;
    case 'k': return Q_k;
    default: break;
    }
    assert(false);
    return Q_N;
}

static auto solve = []()
{
    long long L,X; std::cin >> L >> X;
    std::string S; std::cin >> S;
    std::vector<Q> q(L);
    for(int i=0; i<L; ++i) q[i] = cnv(S[i]);
    enum{ N=4 };
    Q a=Q_1;
    for(int i=0; i<L*N; ++i)
    {
        a = a*q[i%L];
        if(a!=Q_i) continue;
        Q c=Q_1;
        for(int k=L*N-1; k>=0; --k)
        {
            c = q[k%L]*c;
            if(c!=Q_k) continue;
            if((i+1)+(L*N-k) >= X*L) break;
            Q d=Q_1;
            for(int j=0; j<L; ++j) d = d*q[j];
            Q b=Q_1;
            for(int j=0; j<X%N; ++j) b = b*d;
            if(b==Q_i*Q_j*Q_k) return "YES";
            break;
        }
        break;
    }
    return "NO";
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << std::endl;
}
