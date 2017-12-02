package com.zzp.YiYang.util;


import net.sf.json.JSONArray;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.servlet.http.HttpServletRequest;
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

	public static String getJsonToPage(List list, int total) {
		JSONArray jsonArray = JSONArray.fromObject(list);
		String str =jsonArray.toString();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"data\":");
		sb.append(str);
		sb.append(",\"total\":");
		sb.append(total);
		sb.append("}");
		return sb.toString();
	}

	public static boolean isAjax(HttpServletRequest request){
		return  (request.getHeader("X-Requested-With") != null
				&& "XMLHttpRequest".equals(request.getHeader("X-Requested-With").toString())) ;
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

	public static String getUserName() {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();
		System.out.println(userName);
		return userName;
	}

	public static void rollBack() {
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	}
}







