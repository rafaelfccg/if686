
public class MultiplcaMatriz implements Runnable {
	Matriz A;
	Matriz B;
	int linha;
	int coluna;
	Matriz C;
	NotifyObject no;
	int id;
	public MultiplcaMatriz(Matriz A, Matriz B, Matriz C,NotifyObject no,int tot) {
		this.A = A;
		this.B = B;
		this.C = C;
		//linha = li; 
		//coluna = col;
		this.no =no;
		this.id =  tot;
	}
	@Override
	public void run() {
		int att = 0;
		//System.out.println("l: "+linha+" c: "+coluna+" cont:"+att+" tot:"+id);
		synchronized (no) {
			att = no.cont;
			if(no.cont>=id)return ;
			coluna = no.work[1][att];
			linha = no.work[0][att];
			no.cont++;
			//System.out.println("l: "+linha+" c: "+coluna+" cont:"+att+" tot:"+id);
		}
		while(att<id){
			//System.out.println(linha+" "+coluna);
			double val = 0;
			int len = B.arr.length;
			for(int k = 0; k<len ;k++){
				val+= A.getAt(linha,k)*B.getAt(k, coluna);
				
			}
			C.setAt(linha, coluna, val);
			
			synchronized (no) {
				att = no.cont;
				if(no.cont>=id)return ;
				coluna = no.work[1][att];
				linha = no.work[0][att];
				no.cont++;
			}
		}
	}
	
	

}
