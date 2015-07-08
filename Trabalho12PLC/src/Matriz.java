import java.util.Random;


public class Matriz {
	double[][] arr;
	public Matriz(int nrow, int ncol){
		arr = new double[nrow][ncol];
	}
	public void setAt(int i, int j,double val){arr[i][j]=val;}
	public double getAt(int i, int j){return arr[i][j];}
	public void print(){
		for(int i = 0 ; i< arr.length;i++){
			for(int j =0; j<arr[0].length;j++){
				System.out.print(arr[i][j]+"\t");
				
			}
			System.out.println();
		}
	}
	
	public void randomInit(){
		Random randomGenerator = new Random();
		for(int i = 0 ; i< arr.length;i++){
			for(int j =0; j<arr[0].length;j++){
				//System.out.print(arr[i][j]+" ");
				arr[i][j] = randomGenerator.nextInt(10);
			}
			//System.out.println();
		}
	}
}
