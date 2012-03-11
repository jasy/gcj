#include <iostream>
#include <string>

int main () {
    int T;
	std::cin >> T;
	for (int x=1; x<=T; ++x) {
		unsigned long N,K;
		std::cin >> N >> K;
		unsigned long l = 0;
		for (int i=0; i<N; ++i) {
			l |= 1<<i;
		}
		std::string y = (K & l)==l? "ON": "OFF";
		std::cout << "Case #" << x << ": " << y << "\n";
	}
    return 0;
}
