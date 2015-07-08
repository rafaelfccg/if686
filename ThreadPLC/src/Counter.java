
public class Counter implements Runnable {
	long counter;
	static long globalCounter=0;
	long max;
	Thread[] arr;
	int idx;
	 //private static final AtomicInteger nextId = new AtomicInteger(0);
	 private static final ThreadLocal<Integer> counterLocal =
	         new ThreadLocal<Integer>() {
	             @Override protected Integer initialValue() {
	                 return 0;
	         }
	     };
	public Counter(long max,Thread[] o,int idx){
		this.counter = 0;
		this.max = max;
		this.arr = o;
		this.idx = idx;
	}
	
	@Override
	public void run() {
		while(counterLocal.get()< max){
			try {
				Thread.sleep(1l);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				System.out.println("Thread interrompida");
				return;
			}
			counterLocal.set(counterLocal.get()+1);
			System.out.println(counterLocal.get());
			
		}
		for (int i = 0; i < arr.length; i++) {
			if(idx != i)arr[i].interrupt();
		}
		
	}
	
}
