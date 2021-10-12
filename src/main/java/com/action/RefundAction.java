package com.action;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.config.AlipayConfig;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author 羡羡
 */
public class RefundAction extends ActionSupport {
    /**
     * 订单编号
     */
    public String WIDTRout_trade_no;
    /**
     * 交易号
     */
    public String WIDTRtrade_no;
    /**
     * 交易金额
     */
    public String WIDTRrefund_amount;
    /**
     * 交易说明
     */
    public String WIDTRrefund_reason;
    /**
     * 返回执行的编号
     */
    public String WIDTRout_request_no;

    public String getWIDTRout_trade_no() {
        return WIDTRout_trade_no;
    }

    public void setWIDTRout_trade_no(String WIDTRout_trade_no) {
        this.WIDTRout_trade_no = WIDTRout_trade_no;
    }

    public String getWIDTRtrade_no() {
        return WIDTRtrade_no;
    }

    public void setWIDTRtrade_no(String WIDTRtrade_no) {
        this.WIDTRtrade_no = WIDTRtrade_no;
    }

    public String getWIDTRrefund_amount() {
        return WIDTRrefund_amount;
    }

    public void setWIDTRrefund_amount(String WIDTRrefund_amount) {
        this.WIDTRrefund_amount = WIDTRrefund_amount;
    }

    public String getWIDTRrefund_reason() {
        return WIDTRrefund_reason;
    }

    public void setWIDTRrefund_reason(String WIDTRrefund_reason) {
        this.WIDTRrefund_reason = WIDTRrefund_reason;
    }

    public String getWIDTRout_request_no() {
        return WIDTRout_request_no;
    }

    public void setWIDTRout_request_no(String WIDTRout_request_no) {
        this.WIDTRout_request_no = WIDTRout_request_no;
    }

    @Override
    public String execute(){

        return SUCCESS;
    }
}
