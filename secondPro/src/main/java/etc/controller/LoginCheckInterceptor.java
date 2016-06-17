package etc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// ��Ʈ�ѷ��� ��û�� ���޵Ǳ� ���̳� ��û�� ó���ϰ� �� �Ŀ� ������ �ڵ�
// ��� ��Ʈ�ѷ��� ���ͼ��͸� �����ϰ� ����� �� �ֵ��� ������ ���� �ְ�,
// Ư�� ��Ʈ�ѷ��� ���ͼ��͸� �����ϰ� ����ǵ��� ������ �� �ִ�.
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
