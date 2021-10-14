package com.action;

import com.dao.SearchTicketDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

/**
 * @author 羡羡
 */
public class FligMangAction extends ActionSupport {
    /**
     * 航班ID
     */
    int flid;

    public int getFlid() {
        return flid;
    }

    public void setFlid(int flid) {
        this.flid = flid;
    }

    String flnam;

    public String getFlnam() {
        return flnam;
    }

    public void setFlnam(String flnam) {
        this.flnam = flnam;
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

    /**
     * 查询所有和搜索 分页
     * @return
     */
    public String  fseall() throws IOException {
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        //设置当前页 和 每页的数量
        PageHelper.startPage(page,10);
        //查询符合类型的数据
        List  flis=se.flseall(flnam);
        //使用mybateis的分页
        pa=new PageInfo(flis);
        return SUCCESS;
    }


    /**
     * 删除数据
     * @return
     */
    public String fdel(){

        return  SUCCESS;
    }
}
