
public class CreatePessoas extends Thread{
	boolean createSex;
	Banheiro ban;
	Thread[] pessoas;
	
	public CreatePessoas(boolean sex,Banheiro ban){
		this.createSex = sex;
		this.ban = ban;
		pessoas = new Thread[50];
	}
	
	@Override
	public void run(){
		for(int i =0; i<5;i++){
			pessoas[i] = new Thread(new Pessoa(createSex,ban));
			pessoas[i].start();
		}
		for(int i =0; i<5;i++){
			try {
				pessoas[i].join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
