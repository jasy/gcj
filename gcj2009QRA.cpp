#include <iostream>
#include <string>
#include <vector>

static void get_extxt( std::vector<std::string>& v )
{
    std::string str;
    std::cin >> str;
    const int len = str.length();
    for (int i=0; i<len; ++i) {
        int base = i;
        int subs = 1;
        if (str[i] == '(') {
            const int b = str.find( ')', i+1 );
            subs = b-i-1;
            base = i+1;
            i = b;
        }
        v.push_back(str.substr(base, subs));
    }
}

static bool check_match( const std::string& txt, const std::vector<std::string>& extxt )
{
	bool match = true;
	const int n = txt.length();
	for (int i=0; i<n; ++i) {
		if( std::string::npos == extxt[i].find(txt[i]) )
		{
			match = false;
			break;
		}
	}
	return match;
}

static int count_match( const std::vector<std::string>& txt_list )
{
    std::vector<std::string> extxt;
    get_extxt(extxt);
	int n = 0;
	for (auto& v: txt_list) {
		if (check_match(v, extxt)) {
			++n;
		}
	}
	return n;
}

int main () {
	int L,D,N;
    std::cin >> L >> D >> N;
    std::vector<std::string> txt_list(D);
	for (int i=0; i<D; ++i) {
        std::cin >> txt_list[i];
    }
	for (int i=1; i<=N; ++i) {
        std::cout << "Case #" << i << ": " << count_match(txt_list) << "\n";
	}
    return 0;
}
