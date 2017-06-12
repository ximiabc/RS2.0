package com.zqrc.rs.pro.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.zqrc.rs.pro.entity.User;

public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		if (user != null) {
			return arg0.invoke();
		} else {
			return "login";
		}
	}

}
