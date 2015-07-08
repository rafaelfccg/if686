
public class Train {
	
	public static int abc(int a){
		try{
			System.out.println("vai retornar "+a);
			return a;
		}catch(Exception e){
			
		}
		finally{
			System.out.println("eita");
			return 0;
		}
		
	}
	public static void main(String[] args) {
		String s = "Das";
		System.out.println(abc(10));
		try{
			s.charAt(0);
			return;
		}catch(NullPointerException e){
			e.toString();
		}finally{
			System.out.println("asad");
			
		}
	}

}
