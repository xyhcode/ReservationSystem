package com.action;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author 羡羡
 */
public class CaptchaAction extends ActionSupport {
    @Override
    public String execute() throws IOException {
        //获取原生的request
        HttpServletRequest request= ServletActionContext.getRequest();
        HttpServletResponse response=ServletActionContext.getResponse();
        //创建一个宽度 200 高度 100的图形验证码
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(140, 50);
        //得到生成的验证码字符
        String code = lineCaptcha.getCode();
        //将验证码写到会话中
        request.getSession().setAttribute("cod", code);
        //response进行输出
        lineCaptcha.write(response.getOutputStream());
        return SUCCESS;
    }
}
