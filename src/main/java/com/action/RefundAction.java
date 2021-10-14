package com.action;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.alipay.config.AlipayConfig;
import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
import com.entity.OrderInfo;
import com.entity.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import com.tools.HttpClientUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @author 羡羡
 */
public class RefundAction extends ActionSupport {
    /**
     * 订单编号
     */
    public String WIDTRout_trade_no;
    /**
     * 交易号
     */
    public String WIDTRtrade_no;
    /**
     * 交易金额
     */
    public String WIDTRrefund_amount;
    /**
     * 交易说明
     */
    public String WIDTRrefund_reason;
    /**
     * 返回执行的编号
     */
    public String WIDTRout_request_no;

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
     * 航班name
     */
    public String hbname;
    /**
     * 订单ID
     */
    public int hbid;

    /**
     * 航班ID
     */
    public int fjid;

    /**
     * 用户id
     * @return
     */
    public int yhid;

    public int getYhid() {
        return yhid;
    }

    public void setYhid(int yhid) {
        this.yhid = yhid;
    }

    public String getHbname() {
        return hbname;
    }

    public void setHbname(String hbname) {
        this.hbname = hbname;
    }

    public int getHbid() {
        return hbid;
    }

    public void setHbid(int hbid) {
        this.hbid = hbid;
    }

    public int getFjid() {
        return fjid;
    }

    public void setFjid(int fjid) {
        this.fjid = fjid;
    }

    public String getWIDTRout_trade_no() {
        return WIDTRout_trade_no;
    }

    public void setWIDTRout_trade_no(String WIDTRout_trade_no) {
        this.WIDTRout_trade_no = WIDTRout_trade_no;
    }

    public String getWIDTRtrade_no() {
        return WIDTRtrade_no;
    }

    public void setWIDTRtrade_no(String WIDTRtrade_no) {
        this.WIDTRtrade_no = WIDTRtrade_no;
    }

    public String getWIDTRrefund_amount() {
        return WIDTRrefund_amount;
    }

    public void setWIDTRrefund_amount(String WIDTRrefund_amount) {
        this.WIDTRrefund_amount = WIDTRrefund_amount;
    }

    public String getWIDTRrefund_reason() {
        return WIDTRrefund_reason;
    }

    public void setWIDTRrefund_reason(String WIDTRrefund_reason) {
        this.WIDTRrefund_reason = WIDTRrefund_reason;
    }

    public String getWIDTRout_request_no() {
        return WIDTRout_request_no;
    }

    public void setWIDTRout_request_no(String WIDTRout_request_no) {
        this.WIDTRout_request_no = WIDTRout_request_no;
    }

    @Override
    public String execute() throws IOException, AlipayApiException {
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        HttpServletRequest request= ServletActionContext.getRequest();
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();

        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = new String(request.getParameter("WIDTRout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //支付宝交易号
        String trade_no = new String(request.getParameter("WIDTRtrade_no").getBytes("ISO-8859-1"),"UTF-8");
        //请二选一设置
        //需要退款的金额，该金额不能大于订单金额，必填
        String refund_amount = new String(request.getParameter("WIDTRrefund_amount").getBytes("ISO-8859-1"),"UTF-8");
        //退款的原因说明
        String refund_reason = new String(request.getParameter("WIDTRrefund_reason").getBytes("ISO-8859-1"),"UTF-8");
        //标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
        String out_request_no = new String(request.getParameter("WIDTRout_request_no").getBytes("ISO-8859-1"),"UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"trade_no\":\""+ trade_no +"\","
                + "\"refund_amount\":\""+ refund_amount +"\","
                + "\"refund_reason\":\""+ refund_reason +"\","
                + "\"out_request_no\":\""+ out_request_no +"\"}");
        //执行退款
        AlipayTradeRefundResponse arefundresponse = alipayClient.execute(alipayRequest);
        //判断是否成功
        if(arefundresponse.isSuccess()){
            double amount=Double.parseDouble(refund_amount);
            //查询指定订单
            List olis=se.seorder(hbid);
            OrderInfo orin = null;
            //循环赋值
            for(int j=0;j<olis.size();j++){
                OrderInfo or= (OrderInfo) olis.get(j);
                orin=new OrderInfo(or.getOrid(),yhid,fjid,amount,"","",or.getPaytime());
            }
            //更新数据库
            int cf=se.uporder(orin);
            //查询指定订单
            List flis=se.Fliinfo(fjid);
            //票数
            int ps=0;
            //离开城市
            String levcity=null;
            //到达城市
            String arcity=null;
            //循环遍历
            for(int f=0;f<flis.size();f++){
                FlightInfo flg= (FlightInfo) flis.get(f);
                //得到原票数+1
                ps=flg.getVotes()+1;
                //得到离开城市
                levcity=flg.getLeavecity();
                //得到到达城市
                arcity=flg.getArrivecity();
            }
            //实例化航班信息
            FlightInfo fl=new FlightInfo();
            //设置航班票数
            fl.setVotes(ps);
            //设置航班ID
            fl.setFlid(fjid);
            //设置机票金额
            fl.setFares(amount);
            //执行修改数据 数据+1
            int upfl=se.UpFliginfo(fl);
            //用户ID查询用户信息
            List lis=se.seuser(yhid);
            //循环遍历
            for(int i=0;i<lis.size();i++) {
                UserInfo us= (UserInfo) lis.get(i);
                //得到电话 赋值
                smsMob=us.getPhone();
            }
            //发送的短信内容
            smsText="尊敬的旅客 您预定的 "+levcity+" 到达 "+arcity+" 的 "+hbname+" 次航班退票成功！退款金额："+WIDTRrefund_amount+"0元";
            //发送请求
            HttpClientUtil client=HttpClientUtil.getInstance();
            //执行服务器发送验证码
            int result = client.sendMsgUtf8(Uid, Key, smsText, smsMob);
            //提交
            session.commit();
            session.close();
            return SUCCESS;
        }else{
           return ERROR;
        }
    }
}
