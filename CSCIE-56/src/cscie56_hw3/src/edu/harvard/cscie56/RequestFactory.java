package edu.harvard.cscie56;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import javax.servlet.http.HttpSession;

public class RequestFactory {

    static interface Barking extends HttpSession {
        void bark();

    }

    static HttpSession createBarkingSession() {
        ClassLoader classloader = Thread.currentThread().getContextClassLoader();
        Class<?>[] interfaces = { HttpSession.class, Barking.class };
        InvocationHandler ih = new InvocationHandler() {
            public Object invoke(Object proxy, Method method, Object[] args)
                    throws Throwable {
                return null;
            }
        };
        return (HttpSession) Proxy.newProxyInstance(classloader, interfaces, ih);
    }
}