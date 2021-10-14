package com.entity;

import java.util.Date;

/**
 * @author 羡羡
 */
public class OderFligAll {
    public int orid;
    public int userid;
    public int fligid;
    public double amt;
    public String ordernumber;
    public String transactionno;
    public String paytime;
    public int flid;
    public String flname;
    public Date departdate;
    public String leavecity;
    public String leavetime;
    public String leaveairport;
    public String arrivecity;
    public String arrivetime;
    public String arriveairport;
    public int votes;
    public double fares;
    public String punctuality;
    public Date da;

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

    public int getFlid() {
        return flid;
    }

    public void setFlid(int flid) {
        this.flid = flid;
    }

    public String getFlname() {
        return flname;
    }

    public void setFlname(String flname) {
        this.flname = flname;
    }

    public Date getDepartdate() {
        return departdate;
    }

    public void setDepartdate(Date departdate) {
        this.departdate = departdate;
    }

    public String getLeavecity() {
        return leavecity;
    }

    public void setLeavecity(String leavecity) {
        this.leavecity = leavecity;
    }

    public String getLeavetime() {
        return leavetime;
    }

    public void setLeavetime(String leavetime) {
        this.leavetime = leavetime;
    }

    public String getLeaveairport() {
        return leaveairport;
    }

    public void setLeaveairport(String leaveairport) {
        this.leaveairport = leaveairport;
    }

    public String getArrivecity() {
        return arrivecity;
    }

    public void setArrivecity(String arrivecity) {
        this.arrivecity = arrivecity;
    }

    public String getArrivetime() {
        return arrivetime;
    }

    public void setArrivetime(String arrivetime) {
        this.arrivetime = arrivetime;
    }

    public String getArriveairport() {
        return arriveairport;
    }

    public void setArriveairport(String arriveairport) {
        this.arriveairport = arriveairport;
    }

    public int getVotes() {
        return votes;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }

    public double getFares() {
        return fares;
    }

    public void setFares(double fares) {
        this.fares = fares;
    }

    public String getPunctuality() {
        return punctuality;
    }

    public void setPunctuality(String punctuality) {
        this.punctuality = punctuality;
    }

    public Date getDa() {
        return da;
    }

    public void setDa(Date da) {
        this.da = da;
    }

    public OderFligAll(int userid, int fligid, double amt, String ordernumber, String transactionno, String paytime, int flid, String flname, Date departdate, String leavecity, String leavetime, String leaveairport, String arrivecity, String arrivetime, String arriveairport, int votes, double fares, String punctuality, Date da) {
        this.userid = userid;
        this.fligid = fligid;
        this.amt = amt;
        this.ordernumber = ordernumber;
        this.transactionno = transactionno;
        this.paytime = paytime;
        this.flid = flid;
        this.flname = flname;
        this.departdate = departdate;
        this.leavecity = leavecity;
        this.leavetime = leavetime;
        this.leaveairport = leaveairport;
        this.arrivecity = arrivecity;
        this.arrivetime = arrivetime;
        this.arriveairport = arriveairport;
        this.votes = votes;
        this.fares = fares;
        this.punctuality = punctuality;
        this.da = da;
    }

    public OderFligAll(int orid, int userid, int fligid, double amt, String ordernumber, String transactionno, String paytime, int flid, String flname, Date departdate, String leavecity, String leavetime, String leaveairport, String arrivecity, String arrivetime, String arriveairport, int votes, double fares, String punctuality, Date da) {
        this.orid = orid;
        this.userid = userid;
        this.fligid = fligid;
        this.amt = amt;
        this.ordernumber = ordernumber;
        this.transactionno = transactionno;
        this.paytime = paytime;
        this.flid = flid;
        this.flname = flname;
        this.departdate = departdate;
        this.leavecity = leavecity;
        this.leavetime = leavetime;
        this.leaveairport = leaveairport;
        this.arrivecity = arrivecity;
        this.arrivetime = arrivetime;
        this.arriveairport = arriveairport;
        this.votes = votes;
        this.fares = fares;
        this.punctuality = punctuality;
        this.da = da;
    }

    @Override
    public String toString() {
        return "OderFligAll{" +
                "orid=" + orid +
                ", userid=" + userid +
                ", fligid=" + fligid +
                ", amt=" + amt +
                ", ordernumber='" + ordernumber + '\'' +
                ", transactionno='" + transactionno + '\'' +
                ", paytime='" + paytime + '\'' +
                ", flid=" + flid +
                ", flname='" + flname + '\'' +
                ", departdate=" + departdate +
                ", leavecity='" + leavecity + '\'' +
                ", leavetime='" + leavetime + '\'' +
                ", leaveairport='" + leaveairport + '\'' +
                ", arrivecity='" + arrivecity + '\'' +
                ", arrivetime='" + arrivetime + '\'' +
                ", arriveairport='" + arriveairport + '\'' +
                ", votes=" + votes +
                ", fares=" + fares +
                ", punctuality='" + punctuality + '\'' +
                ", da=" + da +
                '}';
    }
}
