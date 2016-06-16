package aop.anno01;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

// ��� Ŭ������ ������ ������ ���
@Service
//aop�� ����Ǿ� �ִ� Ŭ������� ���� ����(aop ����� �����ؼ� ����Ͻ� ������ �߰��� ������ɸ���̶�� ���� ����
@Aspect
public class LogAdvice {
	// ����Ʈ ���� ������ �� �޼ҵ带 �����ؼ� ���� : �޼ҵ���� ����Ʈ�� ���� �ȴܴ�
	@Pointcut("execution(* aop.anno01.UserDAO.get*(..))")
	public void myLogPointcut() { }
	
	@After("myLogPointcut()")
	public void log() {
		System.out.println("-=-=-=-=-=-=- �αױ�� -=-=-=-=-=-=-");
	}
}
