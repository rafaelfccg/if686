
public class Main {
	public static void main(String[] args) {
		Banheiro ban = new Banheiro(5);
		CreatePessoas homens = new CreatePessoas(true, ban);
		CreatePessoas mulheres = new CreatePessoas(false, ban);
		homens.start();
		mulheres.start();
		try {
			homens.join();
			mulheres.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
