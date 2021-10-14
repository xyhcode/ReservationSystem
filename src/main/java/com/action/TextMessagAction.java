package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.HttpClientUtil;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.Random;

/**
 * @author 羡羡
 *
 * 短信发送
 */
public class TextMessagAction extends ActionSupport {
    /**
     * 账号
     */
    public String Uid = "短信账号";
    /**
     * 接口安全秘钥
     */
    public String Key = "短信接口秘钥";
    /**
     * 电话
     */
    public String smsMob;
    /**
     * 短信内容
     */
    public String smsText;
    /**
     * 数字验证码
     */
    public int numbercode;

    public int getNumbercode() {
        return numbercode;
    }

    public void setNumbercode(int numbercode) {
        this.numbercode = numbercode;
    }

    public String getSmsMob() {
        return smsMob;
    }

    public void setSmsMob(String smsMob) {
        this.smsMob = smsMob;
    }

    @Override
    public String execute(){
        //得到用户的电话
        System.out.println("电话："+smsMob);
        //随机数
        Random rd = new Random();
        //产生一个6位数的随机数
        numbercode = rd.nextInt(999999 - 100000 + 1) + 100000;
        //发送的短信验证的验证码
        smsText="验证码："+numbercode;
        //请求服务器
        HttpClientUtil client=HttpClientUtil.getInstance();
        //执行服务器发送验证码
        int result = client.sendMsgUtf8(Uid, Key, smsText, smsMob);
        return  SUCCESS;
    }
}
