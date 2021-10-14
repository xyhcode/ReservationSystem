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

   /**
    * 订单添加
    * @param oinfo
    * @return
    */
   public int Orderadd(OrderInfo oinfo);

   /**
    * 查询指定的航班信息
    * @param flid
    * @return
    */
   public List Fliinfo(int flid);

   /**
    * 修该航班信息
    * @param fl
    * @return
    */
   public int UpFliginfo(FlightInfo fl);

   /**
    * 修改订单
    * @param or
    * @return
    */
   public int uporder(OrderInfo or);

   /**
    * 查询用户信息
    * @param usid
    * @return
    */
   public List seuser(int usid);

   /**
    * 查询指定订单
    * @param orid
    * @return
    */
   public List seorder(int orid);


   //=================================================================
   //后台

   /**
    * 航班总条数
    * @return
    */
   public int secounflig();

   /**
    * 今日起飞
    * @param da
    * @return
    */
   public int sedayfl(Date da);


   /**
    * 今日出行人数
    */
   public int chuxrshu(Date departdate);


   /**
    * 今日已飞
    */
   public List dayyf(Date da);

   /**
    * 今日总前
    * @param
    * @return
    */
   public int jrzq(String value);


   /**
    * 后台用户管理
    */
   public List UserMang(String phone);

   /**
    * 删除用户
    * @param id
    * @return
    */
   public int deus(int id);

   /**
    *航班查询
    * @param fname
    * @return
    */
   public List flseall(String fname);

   /**
    * 后台航班删除
    * @param fid
    * @return
    */
   public int deflg(int fid);

}
