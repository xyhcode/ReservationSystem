package com.action;

import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

/**
 * @author 羡羡
 */
public class UserBookTicket extends ActionSupport {

    /**
     * 界面的航班ID
     */
    public int fid;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
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
        //执行查询的方法
        flinflis=se.findoneflight(fid);
        for(int i=0;i<flinflis.size();i++){
            FlightInfo flg= (FlightInfo) flinflis.get(i);
            fliname=flg.getFlname();
            flpas=flg.getVotes();
        }
        session.close();
        return SUCCESS;
    }
}
