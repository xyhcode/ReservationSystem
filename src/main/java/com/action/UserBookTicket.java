package com.action;

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
import java.util.Date;
import java.util.List;

/**
 * @author 羡羡
 */
public class UserBookTicket extends ActionSupport {

    /**
     * 界面的航班ID
     */
    public int fid;

    /**
     * 状态
     */
    public int stru;

    public int getStru() {
        return stru;
    }

    public void setStru(int stru) {
        this.stru = stru;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    /**
     * 用户信息
     */
    public List uslis;

    public List getUslis() {
        return uslis;
    }

    public void setUslis(List uslis) {
        this.uslis = uslis;
    }

    /**
     * 查询出的数据
     */
    public List flinflis;

    public List getFlinflis() {
        return flinflis;
    }

    public void setFlinflis(List flinflis) {
        this.flinflis = flinflis;
    }

    /**
     * 航班names
     */
    public String fliname;

    /**
     * 票数
     */
    public int flpas;

    /**
     * 票价
     */
    public double flprice;

    public double getFlprice() {
        return flprice;
    }

    public void setFlprice(double flprice) {
        this.flprice = flprice;
    }

    public String getFliname() {
        return fliname;
    }

    public void setFliname(String fliname) {
        this.fliname = fliname;
    }

    public int getFlpas() {
        return flpas;
    }

    public void setFlpas(int flpas) {
        this.flpas = flpas;
    }

    @Override
    public String execute() throws IOException {
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
        //实例化订单实体
        OrderInfo or=new OrderInfo();
        //设置用户的ID
        or.setUserid(userinfoid);
        //设置航班的ID
        or.setFligid(fid);
        //查询用户的订单信息
        uslis=se.seuserorderinfo(or);
        System.out.println("用户ID："+userinfoid);
        //大于0 用户定过这趟航班
        if(uslis.size()>0){
            //状态=1
            stru=1;
        }else{
            //执行查询的方法
            flinflis=se.findoneflight(fid);
            for(int i=0;i<flinflis.size();i++){
                FlightInfo flg= (FlightInfo) flinflis.get(i);
                //得到航班的name
                fliname=flg.getFlname();
                //得到航班的票数
                flpas=flg.getVotes();
                //得到票价
                flprice=flg.getFares();
            }
            //票数大于0 还有票
            if(flpas>0){
                //状态=2
                stru=2;
            }else{
                //没有票 状态=3
                stru=3;
            }
        }
        session.close();
        return SUCCESS;
    }
}
