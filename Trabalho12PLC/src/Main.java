// A = X x 50
// B = 50 x 50
// REFIZ O CODIGO, ATUALIZAR NUMEROS. TA BEM MAIS RAPIDO o/
/*   \N Threads
 *  X \ _| 1    |2   | 3   | 4   |8   |16
 * 10    | 0    |0   |  0  |  0  |0   |0    ms
 * 100   | 15   |16  | 15  | 15  |15  |0    ms
 * 1000  | 31   |15  | 15  | 31  |15  |16   ms
 * 10000 |      |    |     |     |    |
 * 100000| 422  | 422| 437 | 422 |422 |391   ms
 * */
public class Main {
	static final int numberThreads = 1;
	public static void main(String[] args) {
		Thread[] threads = new Thread[numberThreads];
		int nrA = 100000,nrB = 50,ncA =50,ncB = 50;
		Matriz A,B,C;
		NotifyObject no = new NotifyObject();
		//init A
		A = new Matriz (nrA,ncA);
		A.randomInit();
		//init B
		B = new Matriz (nrB,ncB);
		B.randomInit();
		C= new Matriz(nrA,ncB);
		long btime = System.currentTimeMillis();
		no.work = new int[2][nrA*ncB];
		int cont =0;
		for(int i = 0 ; i< nrA;i++){
			for(int j =0; j<ncB;j++){
				no.work[0][cont] = i;
				no.work[1][cont] = j;
				cont++;
				//System.out.println(i+" "+ j);
			}
		}
		for(int i = 0 ; i< numberThreads;i++){
			threads[i] = new Thread(new MultiplcaMatriz(A,B,C,no,nrA*ncB));
			threads[i].start();
			try {
				threads[i].join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		long etime = System.currentTimeMillis();
//		System.out.println("Matriz A");
//		A.print();
//		System.out.println("Matriz B");
//		B.print();
//		System.out.println("RESULTADO:");
//		C.print();
		System.out.println("Total time: "+(etime-btime));
		

	}
	/*public static void main(String[] args) {
		Thread[] threads = new Thread[numberThreads];
		int nrA = 1000,nrB = 50,ncA =50,ncB = 50;
		Matriz A,B,C;
		NotifyObject no = new NotifyObject();
		//init A
		A = new Matriz (nrA,ncA);
		A.randomInit();
		//init B
		B = new Matriz (nrB,ncB);
		B.randomInit();
		
		
		C= new Matriz(nrA,ncB);
		long btime = System.currentTimeMillis();
		//C.print();
		int nextThread = 0;
		for(int i = 0 ; i< nrA;i++){
			for(int j =0; j<ncB;j++){
				if(threads[nextThread]==null){
					threads[nextThread] =new Thread(new MultiplcaMatriz(A,B,C,i,j,no,nextThread));
					threads[nextThread].start();
					//threads[nextThread].
					nextThread++;
					nextThread%=numberThreads;
				}else{
					synchronized (no) {
						try {
							no.wait();
							nextThread = no.id;
							threads[no.id] = new Thread(new MultiplcaMatriz(A,B,C,i,j,no,no.id));
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					threads[nextThread].start();
				}	
			}
		}
		for(int i = 0 ; i< numberThreads;i++){
			if(threads[i]!=null){
				try {
					threads[i].join();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				};
			}
		}
		long etime = System.currentTimeMillis();
		System.out.println("Matriz A");
		A.print();
		System.out.println("Matriz B");
		B.print();
		System.out.println("RESULTADO:");
		C.print();
		System.out.println("Total time: "+(etime-btime));
	}*/
}
