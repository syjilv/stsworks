package aop.anno02;

import java.util.Random;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
@Service
@Aspect
public class CalcAdvice {

	public int val = 0;
	
	@Pointcut("execution(* aop.anno01.UserDAO.*())")
	public void calcPointcut(){}
	
	@Before("calcPointcut()")
	public void calcBefore() {
		Random rand = new Random();
		val = rand.nextInt(100) + 1;
		System.out.println("Before Value = " + val);		
		if(val < 50) {
			val = 50;
		} else if(val >= 50) {
			val = 100;
		}
	}
	@After("calcPointcut()")
	public void calcAfter() {
		int result = 0;
		System.out.print("New Value = " + val);
		for(int i = 1; i <= val; i++) {
			result += i;
		}
		System.out.println(", Total sum = " + result);
	}
}