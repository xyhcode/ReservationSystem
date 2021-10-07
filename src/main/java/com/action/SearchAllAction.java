package com.action;

import cn.hutool.core.date.DateUtil;
import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author 羡羡
 * 首页搜索的action
 */
public class SearchAllAction extends ActionSupport {
    /**
     * 首页搜索form表单提交
     * @return success成功
     */

    /**
     * 离开城市
     */
    String leavecity;
    /**
     * 到达城市
     */
    String arricity;
    /**
     * 出行时间
     */
    String arrtime;

    public String getLeavecity() {
        return leavecity;
    }

    public void setLeavecity(String leavecity) {
        this.leavecity = leavecity;
    }

    public String getArricity() {
        return arricity;
    }

    public void setArricity(String arricity) {
        this.arricity = arricity;
    }

    public String getArrtime() {
        return arrtime;
    }

    public void setArrtime(String arrtime) {
        this.arrtime = arrtime;
    }


    List<FlightInfo> flglis=new ArrayList<FlightInfo>();

    public List<FlightInfo> getFlglis() {
        return flglis;
    }

    public void setFlglis(List<FlightInfo> flglis) {
        this.flglis = flglis;
    }

    @Override
    public String execute() throws Exception {
        //得的session
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        //实例化实体类
        FlightInfo fl=new FlightInfo();
        //设置离开城市
        fl.setLeavecity(leavecity);
        //设置到达城市
        fl.setArrivecity(arricity);
        //时间类型转换
        Date date = DateUtil.parse(arrtime);
        //离开时间
        fl.setDepartdate(date);
        //得到符合条件的数据
        List lis=se.seall(fl);
        //得到当前年月日 yyyy-MM-dd
        String now = DateUtil.now();;
        //当前时间转换为date
        Date nowdate = DateUtil.parse(now);

        //循环遍历
        for(int i=0;i<lis.size();i++){
            FlightInfo flg= (FlightInfo) lis.get(i);
            //得到离开时间
            Date fldtime=flg.getDepartdate();
            //转换类型
            String formatDate = DateUtil.formatDate(fldtime);
            //得到起飞时间
            String starttime=flg.getLeavetime();
            //拼接时间
            String stoptime=formatDate+" "+starttime;
            //拼接的时间转换成Date
            Date pjtime = DateUtil.parse(stoptime);
            //判断起飞时间比当前时间大的航班
            if(pjtime.getTime()>=nowdate.getTime()){
                //符合条件的航班添加到list中
                flglis.add(flg);
            }
        }
        return SUCCESS;
    }

}
