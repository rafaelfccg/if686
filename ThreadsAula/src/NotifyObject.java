import java.util.Vector;


public class NotifyObject {
	Vector<Long> primes;
	boolean sieve[];
	int index;
	int maxi;
	public NotifyObject(int n){
		sieve = new boolean[100000];
		primes= new Vector<Long>();
		this.maxi = n;
		index =1;
		sieve[0]= true;
		sieve[1] = true;
		for(int i = 2;i < 100000;i++){
			sieve[i] = false;
			
		}
		//System.out.println();
	}
	public int nexT(){
		index++;
		while((index < sieve.length && index <=maxi) && sieve[index]){
			index++;
		}
		if(index > sieve.length || index >=maxi) return -1;
		System.out.println(maxi+" "+index+ " ");
		return index;
	}
	public int nextD(){		
		return ++index;
	}
	void print(){
		for(int i = 0; i< primes.size();i++){
			System.out.println(primes.elementAt(i));
			
		}	
	}
	
}
