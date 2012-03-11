#include <iostream>
#include <string>
#include <set>
#include <map>

typedef std::map<char, std::set<char> > check_type;
typedef std::map<std::pair<char, char>, char> combine_type;
typedef std::set<char> clear_type;

static void add_check ( check_type& c, const char b1, const char b2 ) {
    if (!c.count(b1)) {
        std::set<char> s;
        c[b1] = s;
    }
    c[b1].insert(b2);
}

static inline std::pair<char, char> make_key ( const char b1, const char b2 ) {
    if (b1<b2) {
        return std::make_pair(b1,b2);
    }
    else {
        return std::make_pair(b2,b1);
    }
}

static std::string solve () {
    check_type c;
    combine_type ct;
    {
        int C;
        std::cin >> C;
        for (int i=0; i<C; ++i) {
            char b1, b2, t;
            std::cin >> b1 >> b2 >> t;
            add_check(c, b1, b2);
            add_check(c, b2, b1);
            ct[make_key(b1, b2)] = t;
        }
    }
    check_type d;
    clear_type dt;
    {
        int D;
        std::cin >> D;
        for (int i=0; i<D; ++i) {
            char b1, b2;
            std::cin >> b1 >> b2;
            add_check(d, b1, b2);
            add_check(d, b2, b1);
        }
    }
    int N;
    std::cin >> N;
    std::string Ns;
    std::cin >> Ns;
    std::string n("");
    for (int i=0; i<N; ++i) {
        const char ni = Ns[i];
        if (dt.count(ni)) {
            n="";
            dt.clear();
            continue;
        }
        if (c.count(ni) && c[ni].count(Ns[i+1])) {
            n += ct[make_key(ni, Ns[i+1])];
            ++i;
            continue;
        }
        if (d.count(ni)) {
            dt.insert(d[ni].begin(),d[ni].end());
        }
        n += ni;
    }
    std::string s("[");
    for (int i=0; i<n.length(); ++i) {
        if (0!=i) {
            s += ", ";
        }
        s += n[i];
    }
    return s + "]";
}

int main (int argc, const char * argv[])
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << "\n";
    }
    return 0;
}
