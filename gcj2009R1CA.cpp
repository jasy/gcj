#include <iostream>
#include <string>
#include <vector>
#include <map>

static unsigned long long solve()
{
	std::string str;
	std::cin >> str;
	const int len = str.length();
	int base = 0;
	std::map<char,int> num;
	for (auto const&k: str) {
		if (0==num.count(k)) {
			int n;
			if (base > 1) {
				n = base;
			}
			else if( 1 == base ) {
				n = 0;
			}
			else {
				n = 1;
			}
			num[k] = n;
			++base;
		}
	}
	if (1 == base) {
		base = 2;
	}
	unsigned long long unit = 1;
	unsigned long long sum = 0;
	for (int i=len-1; i>=0; --i) {
		auto const& k = str[i];
		sum += num[k] * unit;
		unit *= base;
	}
	return sum;
}

int main () {
	int T;
	std::cin >> T;
	for (int i=1; i<=T; ++i) {
		std::cout << "Case #" << i << ": " << solve() << "\n";
	}
	return 0;
}
