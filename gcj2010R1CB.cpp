#include <iostream>

static int solve() {
	int L,P,C;
	std::cin >> L >> P >> C;
	int n=0;
	for (unsigned long long c=C; L*c<P; c*=c) {
		++n;
	}
	return n;
}

int main () {
	int T;
	std::cin >> T;
	for (int x=1; x<=T; ++x) {
		std::cout << "Case #" << x << ": " << solve() << "\n";
	}
	return 0;
}
