import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;


public class Banheiro {
	AtomicInteger occupiedStalls;
	int numberOfStalls;
	AtomicBoolean mensTurn;
	LinkedList<Pessoa> pessoas;
	
	public Banheiro(int nStalls){
		this.numberOfStalls = nStalls;
		pessoas = new LinkedList<Pessoa>();
		mensTurn = new AtomicBoolean(false);
		this.occupiedStalls = new AtomicInteger(0);
	}
	
	public void entrarHomem(Pessoa p) throws InterruptedException{
		synchronized (pessoas){	
	
			if(((mensTurn.get() && occupiedStalls.get() <numberOfStalls) || occupiedStalls.get() ==0) && pessoas.isEmpty()){
				occupiedStalls.addAndGet(1);
				mensTurn.set(true);
				return;
			}
				
			pessoas.add(p);	
			System.out.println("Homem entrando na Fila");
		}
		synchronized (p) {
			p.wait();
			System.out.println("Homem Entrou no banheiro");
		}
		
	}
	public void entrarMulher(Pessoa p) throws InterruptedException{
		synchronized (pessoas){	
			
			if(((!mensTurn.get() && occupiedStalls.get() <numberOfStalls) || occupiedStalls.get() ==0) && pessoas.isEmpty()){
				occupiedStalls.addAndGet(1);
				mensTurn.set(false);
				return;
			}
				
			pessoas.add(p);	
			System.out.println("Mulher entrando na Fila");
		}
		synchronized (p) {
			p.wait();
			System.out.println("Mulher Entrou no banheiro");
		}
	}
	public void entrar(Pessoa p) throws InterruptedException{
		if(p.sex) entrarHomem(p);
		else entrarMulher(p);
	}
	public synchronized void comeIn(){
		synchronized (pessoas) {
			Iterator<Pessoa> i = pessoas.iterator();
			if(i.hasNext()){
				Pessoa next;
				do{
					next = i.next();
					if(next== null)return;
					if(next.sex == mensTurn.get() && occupiedStalls.get()< numberOfStalls ){
						System.out.println("somou 1-");
						occupiedStalls.incrementAndGet();
						synchronized (next) {
							//System.out.println("Next sex = " + next.sex);
							next.notifyAll();
						}					
						i.remove();
					}else{
						return;
					}
					
				}while(i.hasNext() && next.sex== mensTurn.get() && occupiedStalls.get()< numberOfStalls);
			}
		}
	}
	public synchronized void nextInLine(){
		occupiedStalls.decrementAndGet();
		Pessoa inLine = pessoas.peek();
		if(inLine == null){
			System.out.println("No one else in line");
			return;
		}
		System.out.println("Next in line is "+ inLine.sex+ " there are "+ occupiedStalls.get()+" inside of sex "+ mensTurn.get());
		synchronized (pessoas) {
			if(inLine.sex == mensTurn.get() || occupiedStalls.get()==0){
				
				mensTurn.set(inLine.sex);
				System.out.println("Sexo da vez "+inLine.sex);
				System.out.println("somou 1");
				occupiedStalls.incrementAndGet();
				if(!pessoas.isEmpty())pessoas.removeFirst();
				synchronized(inLine){
					inLine.notifyAll();
				}
				comeIn();
			}
			
		}
	}
}
