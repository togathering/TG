package hangul;

import java.io.UnsupportedEncodingException;

public class Korean {
	public static String toHangul(String str){
		String convertStr=null;
		try {
			convertStr = new String(str.getBytes("8859_1"),"ksc5601");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return convertStr;
	}
}
