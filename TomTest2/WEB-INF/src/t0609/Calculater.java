package t0609;

public class Calculater {
	
	int su1;
	int su2;
	String oper;
	
	int result;
	
	public Calculater(int su1, int su2, String oper) {
		this.su1 = su1;
		this.su2 = su2;
		this.oper = oper;
		choice();
		
	}
	
	public void choice(){
	if(oper.equals("+"))plus();
	else if(oper.equals("-"))minus();
	else if(oper.equals("*"))multi();
	else div();
	
	}
	
	public String getResultStr(){
		return su1+ oper+ su2 +"="+result;
	}
	
	public void plus(){
		result = su1+su2;
	}
	public void minus(){
		result = su1-su2;
	}
	public void multi(){
		result = su1*su2;
	}
	public void div(){
		result  = su1/su2;
	}
	
}
