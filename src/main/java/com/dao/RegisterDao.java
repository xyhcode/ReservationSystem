package com.dao;

import com.entity.UserInfo;

/**
 * @author 羡羡
 */
public interface RegisterDao{
    /**
     * 用户统计
     * @param us
     * @return
     */
    public int useradd(UserInfo us);
}
