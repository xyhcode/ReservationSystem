package com.action;

import cn.hutool.core.date.DateUtil;
import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
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
public class AdminLogAction extends ActionSupport {
    /**
     * 用户账号
     */
    public String name;
    /**
     * 用户密码
     */
    public String pass;

    public int sta;

    public int getSta() {
        return sta;
    }

    public void setSta(int sta) {
        this.sta = sta;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String execute() throws IOException {
        if("admin".equals(name) && "admin".equals(pass)){
            SqlSession session= GetSqlSession.getsSession();
            SearchTicketDao se=session.getMapper(SearchTicketDao.class);
            HttpServletRequest request= ServletActionContext.getRequest();
            //航班总数
            int zshu=se.secounflig();
            request.getSession().setAttribute("hbzs",zshu);
            //今日起飞
            String today= DateUtil.today();
            Date date = DateUtil.parse(today);
            int dayfl=se.sedayfl(date);
            request.getSession().setAttribute("jrqf",dayfl);
            //今日出行人数
            int jrrs=se.chuxrshu(date);
            request.getSession().setAttribute("jrcx",jrrs);
            //今日已分
            List ls=se.dayyf(date);
            //统计已飞数
            int yj=0;
            Date nowtim=new Date();
            for(int i=0;i<ls.size();i++){
                FlightInfo fl= (FlightInfo) ls.get(i);
                //得到时间
                Date lt=fl.getDepartdate();
                //得到离开时间
                String statfl=fl.getLeavetime();
                //时间转String
                String formatDate = DateUtil.formatDate(lt);
                //拼接时间
                String newtime=formatDate+" "+statfl;
                //转换拼接时间
                Date zuihtime = DateUtil.parse(newtime);
                if(nowtim.getTime()>zuihtime.getTime()){
                    yj++;
                }
            }
            request.getSession().setAttribute("jryf",yj);
            return SUCCESS;
        }else{
            sta=1;
            return ERROR;
        }
    }
}
