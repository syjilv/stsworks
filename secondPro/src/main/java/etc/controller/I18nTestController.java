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
		// ��������� �̿��ؼ� Locale ��ü�� ����
		Locale locale = new Locale(lang);
		// Locale��ü�� LocaleResolver�� ���� - Locale�� ������ �� ���
		resolver.setLocale(req, res, locale);
		// ��û�� ���õ� Locale ������ ����
		resolver.resolveLocale(req);
		return new ModelAndView("i18nTest", "command", new MyEmpDTO());
	}
}