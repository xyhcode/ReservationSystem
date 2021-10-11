//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.action;

import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
import com.entity.UsinfoFlig;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;


/**
 * @author 羡羡
 */
public class OrderInfoAction extends ActionSupport {

    List lis = new ArrayList();

    public List getLis() {
        return lis;
    }

    public void setLis(List lis) {
        this.lis = lis;
    }

    //    订单查询
    public String view() throws Exception {

        SqlSession session = GetSqlSession.getsSession();
        SearchTicketDao her = session.getMapper(SearchTicketDao.class);

        List info = her.seorderflig(2);

        for(int i=0;i<info.size();i++){
            UsinfoFlig fo = (UsinfoFlig)info.get(i);
            List list =  fo.flg;
            FlightInfo fli = (FlightInfo)list.get(0);
            lis.add(fli);
        }

        return SUCCESS;
    }


}
