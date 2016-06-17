

package etc.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LangCheckInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	LocaleResolver resolver;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		String lang = req.getParameter("lang");
		if(lang == null) {
			lang = "ko";
		}
		Locale locale = new Locale(lang);
		resolver.setLocale(req, res, locale);
		resolver.resolveLocale(req);
		return true;
	}
}
