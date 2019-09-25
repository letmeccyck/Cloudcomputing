# 实验报告

## 实验一：云计算开发基础

**一、实验内容**：

 

1.1购买腾讯云服务器，使用Web Shell登录已购买的云服务器实例

1.2下载Xshell，并使用登录腾讯云实例

2.1 注册GitHub账号

2.2 在GitHub上创建云计算项目（CloudComputing）并在本地同步

3.1安装VMware WorkStation

3.2在VMware WorkStation安装CentOS操作系统

 

**二、实验步骤**

**1.1购买腾讯云服务器，使用Web Shell登录已购买的云服务器实例**

（一）步骤一：购买腾讯云服务器

![](./images/1.1.png)

（二）步骤二：使用Web Shell登录

![](./images/1.2.png)

**1.2下载Xshell，并使用登录腾讯云实例**

（一）步骤一：下载并安装Xshell

![](./images/1.3.png)

（二）步骤二：查找腾讯云公网地址，使用Xshell登录

![](./images/1.4.png)

![](./images/1.5.png)

（三）步骤三：使用Xshell登录，输入用户密码

![](./images/1.6.png)

![](./images/1.7.png)

 

**2.1 注册GitHub账号**

前往GitHub官网注册

![](./images/1.8.png)

![](./images/1.9.png)

 

**2.2 在GitHub上创建云计算项目（CloudComputing）并在本地同步**

（一）步骤一：安装Git

![](./images/1.10.png)

（二）步骤二：创建SSH Key

验证后发现不存在ssh keys，创建新的ssh key

![](./images/1.11.png)

查看“id_rsa”和“id_rsa.pub”两个文件

![](./images/1.12.png)

（三）步骤三：配置SSH Key

复制“id_rsa.pub”的内容到GitHub网站的Settings–>SSH and GPG keys中

![](./images/1.13.png)

测试SSH Key是否配置成功

![](./images/1.14.png)

（四）步骤四：配置GitHub的用户名和邮箱

![](./images/1.15.png)

（五）步骤五：创建GitHub项目并在本地进行同步

访问GitHub网站并新建代码仓库Cloudcomputing

![](./images/1.16.png)

创建本地代码仓库，并且拷贝GitHub网站中的项目网址

![](./images/1.17.png)

![](./images/1.18.png)

![](./images/1.19.png)

添加远程代码仓库的URL，并验证添加是否成功

![](./images/1.20.png)

新建README文档

![](./images/1.21.png)

添加文件夹中的所有文件

![](./images/1.22.png)

提交文件

![](./images/1.23.png)

推送本地更新至远程服务器

![](./images/1.24.png)

**3.1安装VMware WorkStation**

下载并安装VMware WorkStation

![](./images/1.25.png)

**3.2在VMware WorkStation安装CentOS操作系统**

安装centos镜像文件

配置虚拟机设置

![](./images/1.26.png)

安装成功

![](./images/1.26.1.png)

 