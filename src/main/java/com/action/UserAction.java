package com.action;

import com.dao.SearchTicketDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import com.tools.ReturnJson;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

/**
 * @author 羡羡
 */
public class UserAction extends ActionSupport {
    String soname;

    public int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSoname() {
        return soname;
    }

    public void setSoname(String soname) {
        this.soname = soname;
    }

    int page=1;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    PageInfo pa;

    public PageInfo getPa() {
        return pa;
    }

    public void setPa(PageInfo pa) {
        this.pa = pa;
    }


    public String find() throws IOException {
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        PageHelper.startPage(page,10);
        //得到所有数据
        List lis=se.UserMang(soname);
        //分页
        pa=new PageInfo(lis);
        return SUCCESS;
    }


    public String def() throws IOException {
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        int d=se.deus(id);
        session.commit();
        session.close();
        find();
        return SUCCESS;
    }
}
