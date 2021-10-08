package com.dao;

import com.entity.FlightInfo;

import java.util.Date;
import java.util.List;

/**
 * @author 羡羡
 */
public interface SearchTicketDao {

   /**
    *首页搜索
    * @param fg
    * @return
    */
   public List seall(FlightInfo fg);

   /**
    * 订票查询一个航班的信息
    */
   public List findoneflight(int flid);
}
