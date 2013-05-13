#include <iostream>
#include <string>
#include <vector>

static long long solve()
{
    std::string L;
    int n;
    std::cin >> L >> n;
    const int N = L.size();
    std::vector<bool> cj(N);
    for(int i=0; i<N; ++i)
        cj[i] = !(L[i]=='a' || L[i]=='e' || L[i]=='i' || L[i]=='o' || L[i]=='u');
    std::vector<int> cl(N);
    cl[0] = cj[0]?1:0;
    for(int i=1; i<N; ++i)
        cl[i]=cj[i]? cl[i-1]+1: 0;
    std::vector<int> ccp(N,-1);
    int prev = -1;
    for(int i=N-1; i>=0; --i)
    {
        if(cl[i]>=n)
        {
            for(int j=0; j<n-1; ++j)
                ccp[i-j] = prev;
            prev = i-cl[i]+n;
            for(int j=n-1; j<cl[i]; ++j)
                ccp[i-j] = i-j+n-1;
            i-=cl[i]-1;
        }
        else
        {
            ccp[i] = prev;
        }
    }
    long long c=0;
    for(int i=0; i<N; ++i)
    {
        if(ccp[i]<0)
            break;
        c+=N-ccp[i];
    }
    return c;
}

int main()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
    return 0;
}
