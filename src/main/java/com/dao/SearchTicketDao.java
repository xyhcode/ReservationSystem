package com.dao;

import com.entity.FlightInfo;
import com.entity.OrderInfo;

import java.util.Date;
import java.util.List;

/**
 * @author 羡羡
 */
public interface SearchTicketDao {

   /**
    *首页搜索
    * @param fg 用户对象
    * @return
    */
   public List seall(FlightInfo fg);

   /**
    * 订票查询一个航班的信息
    * @param flid 航班ID
    * @return
    */
   public List findoneflight(int flid);

   /**
    * 用户ID查询用户订单
    * @param
    * @return
    */
   public List seuserorderinfo(OrderInfo orinf);

   /**
    * 查询指定用户的航班信息
    * @param userid
    * @return
    */
   public List seorderflig(int userid);
}
