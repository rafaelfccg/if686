
public class Main {
	static final int NUMBER_OF_THREADS = 100;
	public static void main(String[] args) {
		Thread[] threads = new Thread[NUMBER_OF_THREADS];
		GerenciardorDeFichas gen = new GerenciardorDeFichas(100);
		for(int i = 0 ; i <NUMBER_OF_THREADS;i++){
			threads[i] = new Thread(new Worker(gen,i));
			threads[i].start();
		}
		//gen.next();
		for(int i = 0 ; i <NUMBER_OF_THREADS;i++){
			try {
				threads[i].join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}// = new Thread(new Worker(gen,i));
		}
		
	}
}
