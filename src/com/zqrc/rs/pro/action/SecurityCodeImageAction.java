package com.zqrc.rs.pro.action;  
  
import java.io.ByteArrayInputStream;
import java.util.Map;

import javax.xml.ws.Action;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zqrc.rs.until.image.SecurityCode;
import com.zqrc.rs.until.image.SecurityCode.SecurityCodeLevel;
import com.zqrc.rs.until.image.SecurityImage;
  
public class SecurityCodeImageAction  extends ActionSupport{  
    private static final long serialVersionUID = 1496691731440581303L;  
    //图片流  
    private ByteArrayInputStream imageStream;  
    //session域  
    public ByteArrayInputStream getImageStream() {
        return imageStream;  
    }  
    public void setImageStream(ByteArrayInputStream imageStream) {
        this.imageStream = imageStream;  
    }
    public String execute() throws Exception {
        //如果开启Hard模式，可以不区分大小写  
        String securityCode = SecurityCode.getSecurityCode(4,SecurityCodeLevel.Hard, false).toLowerCase();  
        //获取默认难度和长度的验证码(区分大小写) 
       //String securityCode = SecurityCode.getSecurityCode();
        imageStream = SecurityImage.getImageAsInputStream(securityCode);  
        //放入session中  
        ActionContext.getContext().getSession().put("securityCode", securityCode);
        return SUCCESS;  
    }  
}  