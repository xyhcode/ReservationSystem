# ReservationSystem

#### 介绍
飞机订票系统

#### 软件架构
Struts Mybatis Layui Bootstrap Jquery Echarts

#### 界面
前台
![输入图片说明](https://images.gitee.com/uploads/images/2021/1014/161513_6937df94_7956133.png "屏幕截图.png")
后台
![输入图片说明](https://images.gitee.com/uploads/images/2021/1014/161542_f5f81e51_7956133.png "屏幕截图.png")

#### 数据库设计
[数据库下载](https://sls-study-cloud-1301165591.cos.ap-guangzhou.myqcloud.com/%E8%88%AA%E7%A9%BA%E8%AE%A2%E7%A5%A8%E7%B3%BB%E7%BB%9F%E6%95%B0%E6%8D%AE%E5%BA%93.zip)

#### 使用说明
1. 下载数据库 导入数据库
2. 更改数据库配置文件 druid.properties 修改对应的url、账号、密码、驱动（此项目驱动较高 若使用8.0以下数据库 请更改驱动）
3. 更改支付宝沙箱配置类 AlipayConfig.java 修改对应的支付宝沙箱信息 更改信息参考 [支付宝开放平台](https://open.alipay.com/)
4. 项目中使用了短信发送 需要更改 RefundAction、TextMessagAction类中的短信账号和短信秘钥 参考[网建短信通](https://www.smschinese.com.cn/Login.shtml)  当然了可以使用其他平台短信 如 腾讯、阿里..

#### 项目说明
后台只有用户管理完成了 航班只有界面 其他都是未完成！
