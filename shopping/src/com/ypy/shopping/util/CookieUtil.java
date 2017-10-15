package com.ypy.shopping.util;
/**
 * 得到cookie的工具类
 */
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

//返回cookie
public class CookieUtil {
	public static String getCookie(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					return cookie.getValue();
				}
			}
		}
		return "";
	}
}

