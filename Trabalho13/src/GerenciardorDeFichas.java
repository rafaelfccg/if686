import java.util.concurrent.locks.ReentrantLock;

//esse metodo garante que todas as threads vão executar em algum momento garantindo justiça
public class GerenciardorDeFichas {
	ReentrantLock action;
	//ReentrantLock[] fichas;
	int counter;
	int turn;
	int maxNumberOfThreads;
	
	
	public GerenciardorDeFichas(int n){
		maxNumberOfThreads = n;
		//fichas = new ReentrantLock[n];
		action = new ReentrantLock();
		counter = 0;
		turn = 0;
	
	}
	public synchronized int getFicha(int id){

		//System.out.println("Thread "+id+" Ficha numero:" + counter);
		return counter++;
	}
	public synchronized  void next(){
		
	 turn++;	
	 action.unlock();
	}
	
	

}
