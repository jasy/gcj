#include <iostream>
#include <deque>
#include <algorithm>

typedef char target_type;
typedef int place_type;
typedef struct { target_type target; place_type place; } order_type;
typedef std::deque<order_type> order_container;
typedef struct { target_type self_type; place_type current; std::deque<place_type> order; } status_type;

static int solve() {
    int N;
    std::cin >> N;
    const int target_num = 2;
    const target_type target[target_num] = { 'O', 'B' };
    status_type state[target_num];
    for (int i=0; i<target_num; ++i) {
        state[i].self_type = target[i];
        state[i].current = 1;
    }
    order_container all;
    for (int n=0; n<N; ++n) {
        order_type t;
        std::cin >> t.target >> t.place;
        for (int i=0; i<target_num; ++i) {
            if (state[i].self_type == t.target) {
                state[i].order.push_back(t.place);
            }
        }
        all.push_back(t);
    }
    int s=0;
    for (s=0; !all.empty(); ++s) {
        bool next = false;
        const order_type& t = all.front();
        for (int i=0; i<target_num; ++i) {
            status_type& st = state[i];
            if (!st.order.empty()) {
                const place_type o = st.order.front();
                if (o == st.current) {
                    if (t.target == st.self_type) {
                        st.order.pop_front();
                        next = true;
                    }
                }
                else if (o > st.current) {
                    ++st.current;
                }
                else {
                    --st.current;
                }
            }
        }
        if (next) {
            all.pop_front();
        }
    }
    return s;
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
