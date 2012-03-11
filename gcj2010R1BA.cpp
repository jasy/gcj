#include <iostream>
#include <set>
#include <string>

static void split_read( const int N, std::set<std::string>& v )
{
	for( int i=0; i<N; ++i )
	{
		std::string s;
		std::getline( std::cin, s );
		const int len = s.length();
		const int n=0;
		int lv=0;
		for( int j=1; j<len; ++j )
		{
			if( '/' == s[j] )
			{
				v.insert( s.substr( n, j ) );
			}
		}
		v.insert( s );
	}
}

static int solve()
{
	int N,M;
	std::cin >> N >> M;
	std::set<std::string> v;
	std::set<std::string> w;
	{
		std::string s;
		std::getline( std::cin, s );
	}
	split_read( N, v );
	split_read( M, w );
	int n=0;
	typedef std::set<std::string>::const_iterator It;
	It end=w.end();
	for( It it=w.begin(); it!=end; ++it )
	{
		const std::string s = *it;
		if( !v.count(s) )
		{
			v.insert(s);
			++n;
		}
	}
	return n;
}

int main()
{
	int T;
	std::cin >> T;
	for( int i=1; i<=T; ++i )
		std::cout << "Case #" << i << ": " << solve() << std::endl;
	return 0;
}
