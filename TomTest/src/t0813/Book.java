package t0813;

public class Book {
	private String title;
	private String author;
	private int price;
	
	public Book() {
		title="SpringFramework";
		author="���浿";
		price=30000;
	}
	
	@Override
	public String toString() {
		
		return "["+title+","+author+","+price+"]";
	}
}
