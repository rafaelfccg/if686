
public class Main {
	public static void main(String args[]) {
		int numThreads = 10;
		long start = 0;
		long end = 2000000000;
		long interval = (end - start)/numThreads;
		//Object o = new Object();
		Thread array[] = new Thread[numThreads];
		long times = System.currentTimeMillis();
		for(int i = 0; i<numThreads; i++){
			array[i] = new Thread(new Counter(100,array,i));
			array[i].start();
		}
		/*for(int i = 0; i<numThreads; i++){
			try {
				array[i].join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}*/
		long timend = System.currentTimeMillis();
		System.out.println(timend- times);
	}
}
