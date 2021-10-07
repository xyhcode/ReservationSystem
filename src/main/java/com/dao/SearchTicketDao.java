package com.dao;

import java.util.Date;
import java.util.List;

/**
 * @author 羡羡
 */
public interface SearchTicketDao {
    /**
     * 首页查询 离开城市--->到达城市查询
     * @param leavecity 离开城市
     * @param arrivecity 到达城市
     * @param
     * @return
     */
    public List searchTicket(String leavecity, String arrivecity, Date departdate);
}
