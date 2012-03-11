#include <iostream>
#include <string>
#include <queue>
#include <set>
#include <sstream>

typedef unsigned long v_type;
typedef std::set<v_type> v_list_type;
class state
{
public:
    v_type s_sum;
    v_type s_sum_b;
    v_type p_sum_b;
    v_list_type value_list;
    bool operator<(const state& rhs) const { return this->s_sum < rhs.s_sum; }
};

static std::string solve () {
    int N;
    std::cin >> N;
    v_type s_value;
    std::set<v_list_type> visited;
    std::priority_queue<state> Q;
    {
        state s;
        s.s_sum = 0;
        s.s_sum_b = 0;
        s.p_sum_b = 0;
        for (int i=0; i<N; ++i) {
            v_type t;
            std::cin >> t;
            s.value_list.insert(t);
            s.s_sum += t;
            s.s_sum_b ^= t;
        }
        if (0 != s.s_sum_b) {
            return "NO";
        }
        s_value = s.s_sum;
        Q.push(s);
    }
    while (!Q.empty()) {
        const state v = Q.top();
        Q.pop();
        if (visited.count(v.value_list)) {
            continue;
        }
        visited.insert(v.value_list);
        if (v.s_sum_b == v.p_sum_b && s_value != v.s_sum) {
            std::stringstream ss;
            ss << v.s_sum;
            return ss.str();
        }
        typedef v_list_type::const_iterator Iter;
        Iter end = v.value_list.end();
        state v2 = v;
        for (Iter it=v.value_list.begin(); end!=it; ++it) {
            const v_type t = *it;
            v2.s_sum -= t;
            v2.s_sum_b ^= t;
            v2.p_sum_b ^= t;
            v2.value_list.erase(t);
            Q.push(v2);
            v2.s_sum += t;
            v2.s_sum_b ^= t;
            v2.p_sum_b ^= t;
            v2.value_list.insert(t);
        }
    }
    return "NO";
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
