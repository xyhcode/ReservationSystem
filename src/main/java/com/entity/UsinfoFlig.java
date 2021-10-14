package com.entity;

import java.util.List;

/**
 * @author 羡羡
 */
public class UsinfoFlig {
    public int orid;
    public int userid;
    public int fligid;
    public double amt;
    public String ordernumber;
    public String transactionno;
    public String paytime;
    public List<FlightInfo> flg;

    public int getOrid() {
        return orid;
    }

    public void setOrid(int orid) {
        this.orid = orid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getFligid() {
        return fligid;
    }

    public void setFligid(int fligid) {
        this.fligid = fligid;
    }

    public double getAmt() {
        return amt;
    }

    public void setAmt(double amt) {
        this.amt = amt;
    }

    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber;
    }

    public String getTransactionno() {
        return transactionno;
    }

    public void setTransactionno(String transactionno) {
        this.transactionno = transactionno;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }

    public List<FlightInfo> getFlg() {
        return flg;
    }

    public void setFlg(List<FlightInfo> flg) {
        this.flg = flg;
    }

    public UsinfoFlig() {
    }

    public UsinfoFlig(int userid, int fligid, double amt, String ordernumber, String transactionno, String paytime, List<FlightInfo> flg) {
        this.userid = userid;
        this.fligid = fligid;
        this.amt = amt;
        this.ordernumber = ordernumber;
        this.transactionno = transactionno;
        this.paytime = paytime;
        this.flg = flg;
    }

    public UsinfoFlig(int orid, int userid, int fligid, double amt, String ordernumber, String transactionno, String paytime, List<FlightInfo> flg) {
        this.orid = orid;
        this.userid = userid;
        this.fligid = fligid;
        this.amt = amt;
        this.ordernumber = ordernumber;
        this.transactionno = transactionno;
        this.paytime = paytime;
        this.flg = flg;
    }

    @Override
    public String toString() {
        return "\nUsinfoFlig{" +
                "orid=" + orid +
                ", userid=" + userid +
                ", fligid=" + fligid +
                ", amt=" + amt +
                ", ordernumber='" + ordernumber + '\'' +
                ", transactionno='" + transactionno + '\'' +
                ", paytime='" + paytime + '\'' +
                ", flg=" + flg +
                '}';
    }
}
