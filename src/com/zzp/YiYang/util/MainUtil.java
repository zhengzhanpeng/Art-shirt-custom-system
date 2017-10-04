package com.zzp.YiYang.util;


import net.sf.json.JSONArray;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.util.List;

public class MainUtil {
	
	public static String getJsonToTable(@SuppressWarnings("rawtypes") List list) {
		JSONArray jsonArray = JSONArray.fromObject(list);
		String str =jsonArray.toString();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"data\":");
		sb.append(str);
		sb.append("}");
		return sb.toString();
	}

	public static String hashpw(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}
	
	public static boolean isDouble(String str) {
		try {
			Double.parseDouble(str);
		} catch (NumberFormatException e) {
			return false;
		}
		return true;
	}
}







