import java.util.concurrent.locks.ReentrantLock;


public class Worker implements Runnable {
	GerenciardorDeFichas gen;
	int ficha;
	int id;
	
	
	public Worker(GerenciardorDeFichas gerencia,int id) {
		gen = gerencia;
		this.id = id;
		// TODO Auto-generated constructor stub
	}
	
	public void run() {
		//get 1000 "fichas"
		for (int i = 0; i < 1000; i++) {
			getFicha();
			work();
			gen.next();
		}
		
	}
	
	public void work(){
		System.out.println("Thread "+ id+"Doing work"+"with ficha"+ ficha);
		for (int i = 0; i < 100; i++) {
			
		}
		//System.out.println("Work Done");
		
	}
	public void getFicha(){
		
		ficha = gen.getFicha(id);
		//System.out.println("Thread "+id +" esperando vez");
		//System.out.println(ficha.isLocked());
		//ficha.lock();
		do{ 
			gen.action.lock();
			if(gen.turn!=ficha) gen.action.unlock();
		}while (!gen.action.isHeldByCurrentThread());
		//System.out.println("Vez da Thread "+id );
		
		
	}
	
	
}
