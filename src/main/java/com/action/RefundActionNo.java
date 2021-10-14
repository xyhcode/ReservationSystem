package com.action;

import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
import com.entity.OrderInfo;
import com.entity.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import com.tools.HttpClientUtil;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

/**
 * @author 羡羡
 */
public class RefundActionNo extends ActionSupport {
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
     * 金额
     */
    public double WIDTRrefund_amount;
    /**
     * 订单ID
     */
    public int hbid;

    /**
     * 航班ID
     */
    public int fjid;

    public int getFjid() {
        return fjid;
    }

    public void setFjid(int fjid) {
        this.fjid = fjid;
    }

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

    public double getWIDTRrefund_amount() {
        return WIDTRrefund_amount;
    }

    public void setWIDTRrefund_amount(double WIDTRrefund_amount) {
        this.WIDTRrefund_amount = WIDTRrefund_amount;
    }

    public int getHbid() {
        return hbid;
    }

    public void setHbid(int hbid) {
        this.hbid = hbid;
    }

    @Override
    public String execute() throws IOException {
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        //查询指定订单
        List olis=se.seorder(hbid);
        OrderInfo orin = null;
        //循环赋值
        for(int j=0;j<olis.size();j++){
            OrderInfo or= (OrderInfo) olis.get(j);
            orin=new OrderInfo(or.getOrid(),yhid,fjid,WIDTRrefund_amount,"","",or.getPaytime());
        }
        //更新数据库
        int cf=se.uporder(orin);
        //查询指定订单
        List flis=se.Fliinfo(fjid);
        //票数
        int ps=0;
        //循环遍历
        for(int f=0;f<flis.size();f++){
            FlightInfo flg= (FlightInfo) flis.get(f);
            //得到原票数+1
            ps=flg.getVotes()+1;
        }
        //实例化航班信息
        FlightInfo fl=new FlightInfo();
        //设置航班票数
        fl.setVotes(ps);
        //设置航班ID
        fl.setFlid(fjid);
        //设置机票金额
        fl.setFares(WIDTRrefund_amount);
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
        smsText="尊敬的旅客 您预定的 "+hbname+" 次航班退票成功！退款金额："+WIDTRrefund_amount+"0元";
        //发送请求
        HttpClientUtil client=HttpClientUtil.getInstance();
        //执行服务器发送验证码
        int result = client.sendMsgUtf8(Uid, Key, smsText, smsMob);
        //提交
        session.commit();
        session.close();
        return SUCCESS;
    }
}
