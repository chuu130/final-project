package kr.or.ddit.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoggingAdvice {
	
	public void before() {
		log.info("---------------before-------------------------");
	}
	
	public void after() {
		log.info("<==================after======================>");
	}
	
	// before + after
	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		Object target = joinPoint.getTarget();
		Signature signature = joinPoint.getSignature();
		Object[] args = joinPoint.getArgs();
		log.info("<Before>");
		log.info("-------------------{}.{}({})---------------------",
				target.getClass().getSimpleName()
				,signature.getName(),args);
		Object result = joinPoint.proceed(args);
		log.info("<After>");
		log.info("<==================return value : {}====================>", result);
		return result; // target 실행이후, 실행정보를 넘긴다.
	}
}
