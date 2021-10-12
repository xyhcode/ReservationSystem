package com.action;

import cn.hutool.core.date.DateUtil;
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
import java.util.List;
import java.util.Random;

/**
 * @author 羡羡
 */
public class ConfirmAction extends ActionSupport {

    public String hbname;

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

    public String WIDout_trade_no;
    public double WIDtotal_amount;
    public int hbid;

    public String getWIDout_trade_no() {
        return WIDout_trade_no;
    }

    public void setWIDout_trade_no(String WIDout_trade_no) {
        this.WIDout_trade_no = WIDout_trade_no;
    }

    public double getWIDtotal_amount() {
        return WIDtotal_amount;
    }

    public void setWIDtotal_amount(double WIDtotal_amount) {
        this.WIDtotal_amount = WIDtotal_amount;
    }

    public int getHbid() {
        return hbid;
    }

    public void setHbid(int hbid) {
        this.hbid = hbid;
    }

    @Override
    public  String execute() throws IOException {
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        //获取原生request
        HttpServletRequest request= ServletActionContext.getRequest();
        //使用泛型List保存用户的信息
        List<UserInfo> usein = (List<UserInfo>) request.getSession().getAttribute("userSession");
        System.out.println("91:用户信息："+usein);
        //保存用户的ID
        int userinfoid = 0;
        for(int u=0;u<usein.size();u++){
            UserInfo us=usein.get(u);
            //得到用户ID
            userinfoid=us.getUsId();
        }
        //随机数
        Random rd = new Random();
        //产生一个18位数的随机数
        int transano= rd.nextInt(999999 - 100000 + 1) + 100000;
        int transano2= rd.nextInt(999999 - 100000 + 1) + 100000;
        int transano3= rd.nextInt(999999 - 100000 + 1) + 100000;
        //拼接随机数
        String tano=transano+""+transano2+""+transano3;
        System.out.println(tano);
        //得到当前时间
        String now = DateUtil.now();
        //赋值
        OrderInfo or=new OrderInfo(userinfoid,hbid,WIDtotal_amount,WIDout_trade_no,tano,now);
        //执行添加
        int osu=se.Orderadd(or);
        //查询该航班的信息
        List lis=se.Fliinfo(hbid);
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
        fli.setFlid(hbid);
        fli.setFares(WIDtotal_amount);
        int uppshu=se.UpFliginfo(fli);
        //执行查询航班信息
        flis=se.Fliinfo(hbid);
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
    }
}
