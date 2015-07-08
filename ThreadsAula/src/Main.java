
public class Main {
	public static final int numberOfThreads = 4;
	public static void main(String[] args) {
		NotifyObject no = new NotifyObject(10);
		Thread[] th = new Thread[numberOfThreads];
		for(int i =0; i<numberOfThreads;i++){
			th[i] = new Thread(new Sieve(no));
			th[i].start();
		}
		for(int i =0; i<numberOfThreads;i++){
			try {
				th[i].join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		no.print();
		
	}
}
