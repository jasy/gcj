import java.util.*;
import java.math.*;

public class gcj2010QRB {
	public static void main(String[] args) {
		new gcj2010QRB().run();
	}
	void run() {
		Scanner sc = new Scanner(System.in);
		final int C = sc.nextInt();
		for(int x=1; x<=C; ++x) {
			final int N = sc.nextInt();
			BigInteger[] t = new BigInteger[N];
			for(int i=0; i<N; ++i) {
				t[i] = sc.nextBigInteger();
			}
			System.out.printf("Case #%d: "+solve( N, t ).toString()+"\n", x);
		}
	}
	BigInteger solve( final int N, final BigInteger[] t ) {
		final BigInteger b = t[N-1];
		BigInteger[] d = new BigInteger[N-1];
		int u = 0;
		for(int i=0; i<N-1; ++i) {
			if( t[i].compareTo(b) != 0 ) {
				d[u] = t[i].subtract(b).abs();
				++u;
			}
		}
		final BigInteger T = gcd( d, u );
		if( T.compareTo(BigInteger.ONE) == 0 ) {
			return BigInteger.ZERO;
		}
		else {
			final BigInteger m = b.mod(T);
			if( m.compareTo(BigInteger.ZERO) == 0 ) {
				return BigInteger.ZERO;
			}
			else {
				return T.subtract(m);
			}
		}
	}
	BigInteger gcd( BigInteger[] y, final int N ) {
		if( N<2 ) {
			return y[0];
		}
		else {
			return gcd( y[N-1], y, N-2 );
		}
	}
	BigInteger gcd( BigInteger x, BigInteger[] y, final int n ) {
		final BigInteger r = x.gcd( y[n] );
		if( 0==n ) {
			return r;
		}
		else {
			return gcd( r, y, n-1 );
		}
	}
}
