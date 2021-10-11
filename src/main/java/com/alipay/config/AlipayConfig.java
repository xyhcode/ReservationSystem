package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

/**
 * @author 羡羡
 */
public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    /**
     * 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
     */
    public static String app_id = "2021000117669996";

    /**
     * 商户私钥，您的PKCS8格式RSA2私钥
     */
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDEhRyvHmoRQFQTTQK+O9FwT/O4o6ircsvjc0Tg6+IIUGKLZWw4KnlcZxkR+BUPhifNWl8Rm/jTtlyD+Na1SVNaDTaEbC4nzkJjfBtiq5JVRqNb6THhMolF0pivcTehskEzIfBHmzBbDOlpiLHiwbc79MhSmooj4PsbE2HhOdf3tyxaF5maPycfHJvpqw/WtiXkRAybtc0Jf2QjA+seSRLrbE/ClkOHvTZsMsPcxfpqvOvuQt/OMQixE/KeBEu4yhwe3wpzRZ7FOAcCbtaMFPTsHz2c9JHWcx/fXxxLtWh5dxMaiIMhWS8QGUT1LOxxTcdiR0tQNNei3hXOL1v5YhyhAgMBAAECggEBAIQ0rLReuKp8ZVNKtrK12VM+Zk7rwtf8dY/Bhy/tYHWJZpIynBg48sYoEaSWCc0UyogK6PQWwtHi1+BssjzpZGqrguaZRH/A8catwlqh4+L8j3+QpN7EObdAUzmL6AoeumAkz9nMXD6UtB4sOMe83IE4Tt/LWW2DuEphwrJbUKAza5Wv0CazWYRaA4LAx+/R9IfD/UH+sVWw+/61e2A6pG6T3JG+Slp1mNGkOmsd/qk2aJ90LyGnNSh+1uixTYLXpqKGjhn9Gp7Od04LPnCB/73sX2xPP6QYcmNTYYQIyyY0j8VkGeugaeoF1KLx25unaK04IP1pNRrOYYxjHNrsDMECgYEA4gYy4Kn2ItfJTgq1iMzZ0RmCCgV7IbcPx5z+NDAYcd6Vvo6FNR8DY2fJ8EQUf2asD1NRngjzUK9gs5buFPpa/UuRoNOE4hABZYLioLt9adCTyUBfwH1Vmc77cwp7gXIlQNYR4f3RpWtXAc7d+Gm+xRFOcxUZx2TtxoDGdvnbRZkCgYEA3pU1LuM5QD/NkLjHsvdugZiayZjEUg03MS0HtKfulTWk4u/k4V64v5xYo0prjJFKJKh6dC1WQIeA9E0ywdGeGnO+qF78l5f4wEH9j4gRKGMS1d18cszF8r0V7+Y4WGM+NRTnUyR60YTZH80lz7mGnGvZ5qOquSslcUKAXNw35EkCgYAysMU0UancAp0pHYm9FoQ7OwdJDBWjaBTn5bO1LJwu3Yaj5/7D/SKbZqmJcxtNv08TWNJTKRq4m7yKSm020zcY25vbf9Srhn9prsL43VOxKZAbcI6I8xMBncQS9uTgESN9uQTltDESclJfG2/4yG56b/kyIidX6rDQ9gyMnlio8QKBgQCkKcgf3NbM3EHxC1e+V1/ZlYQUS+f/3F9olZ2pUHJW+kmyVtyonAQGznlRdgH8muvkPZ6TMRz8WvRxOr7E1KWXPObRp70E0cFVi1ZIFkMRVoD92219/inA7lTPqyzDg+7Nl61FVRKAlUrOea/5lQwDMkh0IyI3j+r9rd6eno1agQKBgQCZNgohdF0mIJVAQaQs8n/yA7UC813fMsBJWMHKCnFnj1vumzIxnjMBjScW8+N60OvlPVHF6+zlaxk6Sc2w+pZaaLr2Di3lUhjMnq2e+zASSWahkoOsIXdELTpdZcND5b2j/Ks7whdwRUM+uxrIpAfnYh1Z13IyCHUUXknDAJSvMg==";

    /**
     * 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
     */
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwuK1cC7mMdbfhQ8bpyuNLhXspyhHX1r0fNwO917i//RRpyps/4PixQnrUTYPCdayCsXU75p1gVRNwzwdWQNL1343X2XRUYrgaO1fs3IulFxt1CLNzy8r/0uct9Dk3EYgHOazhCYqA6wmY4N0bOsDhcC3SWIGCU+ONlKkNnt4AWl6L0zHjaoVuiqZFlhacxdZ+VadSueKCYuYDdPb0XzUP/d6clt751womVJCH8hgQmY1EnxQUEJx1/mFyyHx1XCcjuykE9TH71SciF24l5PvkRCoKTRGLrnDrZaMxUQvR1sYajrKZcguWwmJufVc7fqx50gI9BliDTF8VB8PtjFdgwIDAQAB";

    /**
     * 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
     */
    public static String notify_url = "http://localhost:8090//alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

    /**
     * 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
     */
    public static String return_url = "http://localhost:8090/PayTreasureToPayBack/ConfigServlet/PaySuccessful";

    /**
     * 签名方式
     */
    public static String sign_type = "RSA2";

    /**
     * 字符编码格式
     */
    public static String charset = "utf-8";

    /**
     * 支付宝网关
     */
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    /**
     * 支付宝网关
     */
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        System.out.println("Log:"+sWord);
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}


