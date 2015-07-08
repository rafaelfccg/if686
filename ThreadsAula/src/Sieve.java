
public class Sieve implements Runnable{
	
	NotifyObject no;
	
	public Sieve(NotifyObject no){
		this.no = no;
		
	}
	
	@Override
	public void run() {
		long n,maxi;
		synchronized(no){
			n = no.nexT();
			maxi = no.maxi;
		}
		long aux = n ;
		System.out.println("Check "+n);
		while(n !=-1){
			while(aux < Math.min(maxi,10000)){
				no.sieve[(int) aux] = true;
				aux+=n;
				
			}
			synchronized(no){
				no.primes.add(n);
				n = no.nexT();
				System.out.println("Check "+n);
			}
		}
		synchronized(no){
			n = no.nextD();
		}
		while(n < no.maxi){
			boolean f  = false;
			for (int i = 0; i < no.primes.size(); i++){
				if (n % no.primes.elementAt(i) == 0) f= true;
			
			}
			if(!f) no.primes.add(n);
			synchronized(no){
				no.primes.add(n);
				n = no.nextD();
			}
		}
		
		
	}

}
