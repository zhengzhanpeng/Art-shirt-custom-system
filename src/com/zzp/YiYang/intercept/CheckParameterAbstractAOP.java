package com.zzp.YiYang.intercept;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 用于检验从前台接收的所有参数是否符合要求
 *
 * @author ho
 * @create 2017-09-25 10:31
 */
public abstract class CheckParameterAbstractAOP {
    protected Map<String, String> returnMessage;

    @Resource
    public void setReturnMessage(Map<String, String> returnMessage) {
        this.returnMessage = returnMessage;
    }

    public Object check(ProceedingJoinPoint joinPoint) throws Throwable {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        String[] strings = methodSignature.getParameterNames();
        Object[] objects = joinPoint.getArgs();
        boolean isTrue = true;
        String string = null;
        if (objects.length == 0 || strings.length == 0) {
            return joinPoint.proceed();
        }
        try {
            string = checkObject(objects[0], strings[0]);
        } catch (Exception e) {
            e.printStackTrace();
            isTrue = false;
            string = returnMessage.get("SYSTEM_ERROR");
        } finally {
            if(isTrue == false || string != null) {
                return string;
            } else {
                return joinPoint.proceed();
            }
        }
    }

    public abstract String checkObject(Object object, String str);
}
