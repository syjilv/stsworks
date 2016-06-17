package etc.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import emp.dto.MyEmpDTO;

@Controller
public class I18nTestController {
	@Autowired
	LocaleResolver resolver;
	@RequestMapping("/i18nTest.do")
	public ModelAndView showPage(String lang, HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 언어정보를 이용해서 Locale 객체를 생성
		Locale locale = new Locale(lang);
		// Locale객체를 LocaleResolver에 셋팅 - Locale을 변경할 때 사용
		resolver.setLocale(req, res, locale);
		// 요청과 관련된 Locale 정보를 리턴
		resolver.resolveLocale(req);
		return new ModelAndView("i18nTest", "command", new MyEmpDTO());
	}
}
