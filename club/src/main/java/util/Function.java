package util;

import java.sql.Timestamp;

public class Function {
	//시간 메서드
	public static String getYmd(Timestamp t) {
		return String.valueOf(t).substring(0,10);
	}
	
}
