package net.therapservices.profiler;

/**
 * Created with IntelliJ IDEA.
 * User: Bazlur Rahman Rokon
 * Date: 1/3/13
 * Time: 1:12 AM
 */
public aspect MethodExecutionTimeProfiler {
    pointcut methodExecutionTime(): execution(public * * (..));

    Object around (): methodExecutionTime(){
        long statTime = System.currentTimeMillis();
        Object ret = proceed();
        long endTime = System.currentTimeMillis();
        System.out.println(thisJoinPoint.getSignature() + " took " + (endTime - statTime) + " milli seconds");
        return ret;
    }
}
