
public class Pessoa implements Runnable{
	boolean sex;//1 homem 0 mulher
	Banheiro ban;
	
	Pessoa(boolean sex, Banheiro ban){
		this.sex = sex;
		this.ban = ban;
		
	}
	
	@Override
	public void run() {
		try {
			ban.entrar(this);
			if(sex) System.out.println("Homem no banheiro");
			else System.out.println("Mulher no banheiro");
			work();
			ban.nextInLine();
			if(sex) System.out.println("Homem saiu do banheiro");
			else System.out.println("Mulher saiu do banheiro");
			
			
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void work() {
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
