package aop02;

import java.util.Random;

public class CalcAdvice {
	
	public int val = 0;
	
	public void calcBefore() {
		Random rand = new Random();
		val = rand.nextInt(100);
		System.out.println("Before Value = " + val);		
		if(val < 50) {
			val = 50;
		} else if(val >= 50) {
			val = 100;
		}
	}
	
	public void calcAfter() {
		int result = 0;
		System.out.print("New Value = " + val);
		for(int i = 1; i <= val; i++) {
			val += val;
		}
		System.out.println(", Total sum = " + result);
	}
}