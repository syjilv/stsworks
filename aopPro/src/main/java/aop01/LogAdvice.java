package aop01;
// 모든 클래스에 적용할 공통의 모듈
public class LogAdvice {
	public void log() {
		System.out.println("-=-=-=-=-=-=- 로그기록 -=-=-=-=-=-=-");
	}
}
