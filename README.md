# fake_ap_hijack_https
搭建WiFi蜜罐进行HTTPS证书劫持获取WEB系统帐号密码

##准备
- VMware Workstation
- Kali VMware镜像
- NetGear WG111v3 USB网卡

##网卡说明
- 需要aircrack-ng兼容性良好系列网卡（具体详见http://www.aircrack-ng.org/doku.php?id=compatibility_drivers ）
- 网卡连入虚拟机时，需要选择桥接模式

##系统组件准备
在Kali下需要安装isc_dhcp_server组件
```
apt-get install isc-dhcp-server
```
/etc/dhcp/dhcpd.conf内容如下：
```
authoritative;

default-lease-time 700;
max-lease-time 8000;

subnet 192.168.123.0 netmask 255.255.255.0 {
option routers 192.168.123.1;
option subnet-mask 255.255.255.0;

option domain-name-servers 192.168.123.1;

range 192.168.123.10 192.168.123.100;

}
```

## 劫持脚本说明
### 第一步：monitor模式切换与AP建立
```
./wifi_init.sh
```
### 第二步：at0接口启动与DHCP服务启动
```
./wifi_atup.sh
```
### 第三步：iptables启用NAT相关参数
```
./wifi_nat.sh
```
### 第四步：DNS代理服务启动
```
./wifi_dns.sh
```
### 第五步：SSL劫持服务启动以及与之相关iptables转发参数
```
./wifi_ssl_hijack.sh
```
### 第六步：展示帐号密码
```
./wifi_show_pass.sh
```
## 参考资料
- 利用Kali进行WiFi钓鱼测试实战 - http://www.freebuf.com/articles/wireless/69840.html
- SSL中间人证书攻击测试演练 - http://www.freebuf.com/sectool/48016.html

## 运行截图展示
<img src="https://raw.githubusercontent.com/LennyLeng/fake_ap_hijack_https/master/run_screenshot.png">
