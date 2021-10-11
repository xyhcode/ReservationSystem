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
    public String Uid = "林沐xyh";
    //接口安全秘钥
    public String Key = "xyh2730023435";
    //电话
    public String smsMob;
    //短信内容
    public String smsText;
    //发送的数字
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
