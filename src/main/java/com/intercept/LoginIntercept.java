package com.intercept;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginIntercept extends AbstractInterceptor{

    @Override
    public String intercept(ActionInvocation ai) throws Exception {

        Object obj = ActionContext.getContext().getSession().get("userSession");
        
        if(obj == null){
            return "error";
        }

        String ik = ai.invoke();
        return ik;
    }

}
