package t0619;

import java.util.ArrayList;

public class ForTest {
   public static void test(String ... names){//String names[]�迭 ���
//	  for(int i=0; i<names.length; i++){
//		  System.out.println(names[i]);
//	  }
	   for(String name : names){
		   System.out.println(name);
	   }
   }
	
   public static void main(String[] args) {
	   String strArr[]={"ȫ�浿","�����","���ֿ�"};
//	   for(�ڷ��� ����:�迭�� �Ǵ� List��){
//		   
//	   }
	   for(String name:strArr){
		   System.out.println(name);
	   }
	   ArrayList<String> list = new ArrayList<String>();
	      list.add("����");
	      list.add("�ؿ�");
	      list.add("�뼺");
	      list.add("��ȣ");
	   for(String name:list){
		   System.out.println(name);
	   }
	   System.out.println("=========");
	   test("��ȣ","����","����","����","���","���");
	   /*
	     <JavaScript���>
	     var array = [1,2,3,5];
	     for(var i in array){
	        document.write(i);
	     }
	     
	    */
	   
   }//main
}





