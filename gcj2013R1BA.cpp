#include <iostream>
#include <vector>
#include <algorithm>

static int solve ()
{
    int A,N;
    std::cin >> A >> N;
    std::vector<int> m(N);
    for(auto& v: m)
        std::cin >> v;
    std::sort(m.begin(),m.end());
    std::vector<bool> c(N+1,false);
    std::vector<int> a(N+1);
    c[0]=true;
    a[0]=A;
    for(int n=0; n<N; ++n)
    {
        std::vector<bool> cn(N+1,false);
        std::vector<int> an(N+1);
        const int v = m[n];
        for(int i=0; i<=N; ++i)
        {
            if(c[i])
            {
                int na = a[i];
                if(na>v)
                {
                    cn[i]=true;
                    an[i]=std::max(an[i],na+v);
                    continue;
                }
                if(i<N)
                {
                    cn[i+1]=true;
                    an[i+1]=std::max(an[i+1],na);
                }
                if(na>1)
                {
                    for(int j=i+1; j<=N; ++j)
                    {
                        na=na*2-1;
                        if(na>v)
                        {
                            cn[j]=true;
                            an[j]=std::max(an[j],na+v);
                            break;
                        }
                    }
                }
            }
        }
        c.swap(cn);
        a.swap(an);
    }
    for(int i=0; i<=N; ++i)
        if(c[i])
            return i;
    return -1;
}

int main ()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << '\n';
    }
    return 0;
}
