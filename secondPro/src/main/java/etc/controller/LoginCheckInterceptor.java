package etc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 컨트롤러에 요청이 전달되기 전이나 요청을 처리하고 난 후에 실행할 코드
// 모든 컨트롤러가 인터셉터를 실행하고 실행될 수 있도록 구현할 수도 있고,
// 특정 컨트롤러만 인터셉터를 실행하고 실행되도록 설정할 수 있다.
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		
		if(session.getAttribute("userInfo") == null) {
			response.sendRedirect("login.do");
			return false;
		} else {
			return true;
		}
	}
}
