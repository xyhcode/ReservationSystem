//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.action;

import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
import com.entity.OderFligAll;
import com.entity.UserInfo;
import com.entity.UsinfoFlig;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * @author 羡羡
 */
public class OrderInfoAction extends ActionSupport {

    /**
     * 保存用户订单信息 和 航班信息
     */
    List<OderFligAll> orlis=new ArrayList<OderFligAll>();
    /**
     * 当前时间
     */
    Date da=new Date();

    public Date getDa() {
        return da;
    }

    public void setDa(Date da) {
        this.da = da;
    }

    public List<OderFligAll> getOrlis() {
        return orlis;
    }

    public void setOrlis(List<OderFligAll> orlis) {
        this.orlis = orlis;
    }

    //    订单查询
    public String view() throws Exception {

        SqlSession session = GetSqlSession.getsSession();
        SearchTicketDao her = session.getMapper(SearchTicketDao.class);

        //获取原生request
        HttpServletRequest request= ServletActionContext.getRequest();
        //使用泛型List保存用户的信息
        List<UserInfo> usein = (List<UserInfo>) request.getSession().getAttribute("userSession");
        //保存用户的ID
        int userinfoid = 0;
        for(int u=0;u<usein.size();u++){
            UserInfo us=usein.get(u);
            //得到用户ID
            userinfoid=us.getUsId();
        }
        //查询订单和航班信息两表联查
        List info = her.seorderflig(userinfoid);
        for(int i=0;i<info.size();i++){
            UsinfoFlig fo = (UsinfoFlig)info.get(i);
            List list =  fo.flg;
            FlightInfo fli = (FlightInfo)list.get(0);
            //循环放入
            OderFligAll orfl=new OderFligAll(fo.getOrid(),fo.getUserid(),fo.getFligid(),fo.getAmt(),fo.getOrdernumber(),fo.getTransactionno(),fo.getPaytime(),fli.getFlid(),fli.getFlname(),fli.getDepartdate(),fli.getLeavecity(),fli.getLeavetime(),fli.getLeaveairport(),fli.getArrivecity(),fli.getArrivetime(),fli.getArriveairport(),fli.getVotes(),fli.getFares(),fli.getPunctuality());
            orlis.add(orfl);
        }
        return SUCCESS;
    }


}
