package t0619;

import java.util.ArrayList;

public class ForTest {
   public static void test(String ... names){//String names[]배열 취급
//	  for(int i=0; i<names.length; i++){
//		  System.out.println(names[i]);
//	  }
	   for(String name : names){
		   System.out.println(name);
	   }
   }
	
   public static void main(String[] args) {
	   String strArr[]={"홍길동","길라임","김주원"};
//	   for(자료형 변수:배열명 또는 List명){
//		   
//	   }
	   for(String name:strArr){
		   System.out.println(name);
	   }
	   ArrayList<String> list = new ArrayList<String>();
	      list.add("소희");
	      list.add("준원");
	      list.add("용성");
	      list.add("윤호");
	   for(String name:list){
		   System.out.println(name);
	   }
	   System.out.println("=========");
	   test("규호","성민","승주","슬기","경민","길순");
	   /*
	     <JavaScript경우>
	     var array = [1,2,3,5];
	     for(var i in array){
	        document.write(i);
	     }
	     
	    */
	   
   }//main
}





