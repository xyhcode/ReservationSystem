package com.entity;


import java.util.Date;

/**
 * @author 羡羡
 */
public class FlightInfo {
    /**
     * ID
     */
    public int flid;
    /**
     * 航班名称
     */
    public String flname;
    /**
     * 时间
     */
    public Date departdate;
    /**
     * 离开城市
     */
    public String leavecity;
    /**
     * 离开时间
     */
    public String leavetime;
    /**
     * 离开机场
     */
    public String leaveairport;
    /**
     * 到达城市
     */
    public String arrivecity;
    /**
     * 到达时间
     */
    public String arrivetime;
    /**
     * 到达的机场
     */
    public String arriveairport;
    /**
     * 票数
     */
    public int votes;
    /**
     * 票价
     */
    public double fares;
    /**
     * 准点率
     */
    public String punctuality;

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

    public FlightInfo() {
    }

    public FlightInfo(String flname, Date departdate, String leavecity, String leavetime, String leaveairport, String arrivecity, String arrivetime, String arriveairport, int votes, double fares, String punctuality) {
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
    }

    public FlightInfo(int flid, String flname, Date departdate, String leavecity, String leavetime, String leaveairport, String arrivecity, String arrivetime, String arriveairport, int votes, double fares, String punctuality) {
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
    }

    @Override
    public String toString() {
        return "\nFlightInfo{" +
                "flid=" + flid +
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
                '}';
    }
}
