package etc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String ref = request.getRequestURI();
		System.out.println("inter" + ref);

		if(ref != null) {
			ref = ref.replace("/finalshop", "");
		}
		
		if (request.getSession(false).getAttribute("member") == null) {
			response.sendRedirect("/finalshop/member/login.do?ref=" + ref);
			return false;
		}
		return true;
	}
}