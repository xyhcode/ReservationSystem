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
    public String Uid = "林沐xyh";
    //接口安全秘钥
    public String Key = "xyh2730023435";
    //电话
    public String smsMob;
    //短信内容
    public String smsText;

    public String hbname;
    public double WIDTRrefund_amount;
    public int hbid;

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
        List olis=se.seorder(hbid);
        OrderInfo orin = null;
        for(int j=0;j<olis.size();j++){
            OrderInfo or= (OrderInfo) olis.get(j);
            orin=new OrderInfo(or.getOrid(),yhid,fjid,WIDTRrefund_amount,"","",or.getPaytime());
        }
        int cf=se.uporder(orin);
        List flis=se.Fliinfo(fjid);
        int ps=0;
        for(int f=0;f<flis.size();f++){
            FlightInfo flg= (FlightInfo) flis.get(f);
            ps=flg.getVotes()+1;
        }

        FlightInfo fl=new FlightInfo();
        fl.setVotes(ps);
        fl.setFlid(fjid);
        fl.setFares(WIDTRrefund_amount);
        int upfl=se.UpFliginfo(fl);
        List lis=se.seuser(yhid);
        for(int i=0;i<lis.size();i++) {
            UserInfo us= (UserInfo) lis.get(i);
            smsMob=us.getPhone();
        }
        smsText="尊敬的旅客 您预定的 "+hbname+" 次航班退票成功！退款金额："+WIDTRrefund_amount+"0元";
        HttpClientUtil client=HttpClientUtil.getInstance();
        //执行服务器发送验证码
        int result = client.sendMsgUtf8(Uid, Key, smsText, smsMob);
        session.commit();
        session.close();
        return SUCCESS;
    }
}
