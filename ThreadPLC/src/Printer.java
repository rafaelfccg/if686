
public class Printer implements Runnable{
	long start;
	long end;
	public Printer(long start, long end){
		this.start = start;
		this.end = end;
		
	}
	
	
	@Override
	public void run() {
		for(long i = start ; i<end; i++){
			//System.out.println(i);
		}
		
	}

}
