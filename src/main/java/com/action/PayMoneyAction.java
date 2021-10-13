package com.action;

import cn.hutool.core.date.DateUtil;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;
import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
import com.entity.OrderInfo;
import com.entity.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author 羡羡
 */
public class PayMoneyAction extends ActionSupport {

    String app_id;
    String auth_app_id;
    String charset;
    String method;
    String out_trade_no;
    String seller_id;
    String sign;
    String sign_type;
    String timestamp;
    String total_amount;
    String trade_no;
    String version;

    public String getApp_id() {
        return app_id;
    }

    public void setApp_id(String app_id) {
        this.app_id = app_id;
    }

    public String getAuth_app_id() {
        return auth_app_id;
    }

    public void setAuth_app_id(String auth_app_id) {
        this.auth_app_id = auth_app_id;
    }

    public String getCharset() {
        return charset;
    }

    public void setCharset(String charset) {
        this.charset = charset;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(String seller_id) {
        this.seller_id = seller_id;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getSign_type() {
        return sign_type;
    }

    public void setSign_type(String sign_type) {
        this.sign_type = sign_type;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public String getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(String total_amount) {
        this.total_amount = total_amount;
    }

    public String getTrade_no() {
        return trade_no;
    }

    public void setTrade_no(String trade_no) {
        this.trade_no = trade_no;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    /**
     * 航班name
     */
    public String hbname;
    /**
     * 剩余票数
     */
    public int punumber;

    public String getHbname() {
        return hbname;
    }

    public void setHbname(String hbname) {
        this.hbname = hbname;
    }

    public int getPunumber() {
        return punumber;
    }

    public void setPunumber(int punumber) {
        this.punumber = punumber;
    }


    public List flis;

    public List getFlis() {
        return flis;
    }

    public void setFlis(List flis) {
        this.flis = flis;
    }

    /**
     * 支付成功
     * @return
     */
    @Override
    public String execute() throws IOException, AlipayApiException {
        /* *
         * 功能：支付宝服务器同步通知页面
         * 日期：2017-03-30
         * 说明：
         * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
         * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
         *************************页面功能说明*************************
         * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
         */
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        HttpServletRequest request= ServletActionContext.getRequest();
        //获取支付宝GET过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        //调用SDK验证签名
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
            //输出 订单号 交易号  付款金额
            System.out.println("商户订单号："+out_trade_no+" "+"交易宝账号："+trade_no+" "+"付款金额："+total_amount);
            //得到航班ID
            String hbid= (String) request.getSession().getAttribute("hbid");
            System.out.println("航班ID："+hbid);
            //转换航班ID
            int fjid=Integer.parseInt(hbid);
            //转换总金额
            double amount=Double.parseDouble(total_amount);
            //使用泛型List保存用户的信息
            List<UserInfo> usein = (List<UserInfo>) request.getSession().getAttribute("userSession");
            //保存用户的ID
            int userinfoid = 0;
            for(int u=0;u<usein.size();u++){
                UserInfo us=usein.get(u);
                //得到用户ID
                userinfoid=us.getUsId();
            }
            System.out.println("187:用户信息："+userinfoid);

            //得到当前时间
            String now = DateUtil.now();
            //赋值
            OrderInfo or=new OrderInfo(userinfoid,fjid,amount,out_trade_no,trade_no,now);
            //执行添加
            int osu=se.Orderadd(or);
            //查询该航班的信息
            List lis=se.Fliinfo(fjid);
            //保存票数
            int ps=0;

            //循环遍历得的票数
            for(int i=0;i<lis.size();i++){
                FlightInfo flg= (FlightInfo) lis.get(i);
                //原票数减一
                ps=flg.getVotes()-1;
            }
            //执行修改票数
            FlightInfo fli=new FlightInfo();
            fli.setVotes(ps);
            fli.setFlid(fjid);
            fli.setFares(amount);
            int uppshu=se.UpFliginfo(fli);
            //执行查询航班信息
            flis=se.Fliinfo(fjid);
            //循环遍历
            for(int u=0;u<flis.size();u++){
                FlightInfo flg= (FlightInfo) flis.get(u);
                //得的航班的name
                hbname=flg.getFlname();
                //得的票数
                punumber=flg.getVotes();
            }
            //提交代码
            session.commit();
            session.close();
            return SUCCESS;
        }else{
            System.out.println("验签失败");
            return ERROR;
        }
    }
}
