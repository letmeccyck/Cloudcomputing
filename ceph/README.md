# 实验报告

## 实验四：Ceph的安装与实践

#### 1.配置节点

添加用户并配置sudo权限**

useradd -d /home/cephuser -m cephuser

passwd cephuser

echo "cephuser ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/cephuser

chmod 0440 /etc/sudoers.d/cephuser

sed -i s'/Defaults requiretty/#Defaults requiretty'/g /etc/sudoers

![](../images/4.1.png)



**安装配置ntp服务**

yum install -y ntp ntpdate ntp-doc

ntpdate 0.us.pool.ntp.org

hwclock --systohc

systemctl enable ntpd.service

systemctl start ntpd.service

![](../images/4.2.png)

**禁用SELINUX**

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

**安装设置open-vm-tools服务自动启动**

yum install -y open-vm-tools

systemctl enable vmtoolsd

systemctl start vmtoolsd

##### 添加ceph仓库：

sudo vi /etc/yum.repos.d/ceph.repo

##### ：

`[ceph]`

`name=Ceph packages for $basearch`

`baseurl=http://mirrors.163.com/ceph/rpm-jewel/el7/$basearch`

`enabled=1`

`gpgcheck=0`

`priority=1`

`type=rpm-md`

`gpgkey=http://mirrors.163.com/ceph/keys/release.asc`

`[ceph-noarch]`

`name=Ceph noarch packages`

`baseurl=http://mirrors.163.com/ceph/rpm-jewel/el7/noarch`

`enabled=1`

`gpgcheck=0`

`priority=1`

`type=rpm-md`

`gpgkey=http://mirrors.163.com/ceph/keys/release.asc`

`[ceph-source]`

`name=Ceph source packages`

`baseurl=http://mirrors.163.com/ceph/rpm-jewel/el7/SRPMS`

`enabled=0`

`gpgcheck=0`

`type=rpm-md`

`gpgkey=http://mirrors.163.com/ceph/keys/release.asc`

`priority=1`

![](../images/4.3.png)

![](../images/4.4.png)

##### 防火墙设置

开启

systemctl start firewalld

自启

systemctl enable firewalld

##### 克隆为三台虚拟机

Admin

IP：192.168.121.128

Mon1

IP：192.168.121.129

osd1

IP：192.168.121.130

osd2

IP：192.168.121.131

![](../images/4.5.png)

 

##### 主控节点防火墙

sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

sudo firewall-cmd --zone=public --add-port=2003/tcp --permanent

sudo firewall-cmd --zone=public --add-port=4505-4506/tcp --permanent

sudo firewall-cmd --reload

 

![](../images/4.6.png)

##### monistor节点防火墙

sudo firewall-cmd --zone=public --add-port=6789/tcp --permanent

sudo firewall-cmd --reload

![](../images/4.7.png)

##### 普通节点防火墙

sudo firewall-cmd --zone=public --add-port=6800-7300/tcp --permanent

sudo firewall-cmd --reload  

![](../images/4.8.png)

#### 2.配置SSH服务器

##### 主控节点

vi /etc/hosts

![](../images/4.9.png)

 

##### 设置免密登录ssh

su – cephuser

![](../images/4.10.png)

##### 生成密钥

ssh-keygen

![](../images/4.11.png)

vi ~/.ssh/config

##### ：

![](../images/4.12.png)

 

##### 更改配置文件的权限

chmod 644 ~/.ssh/config

ssh-keyscan osd1 osd2 mon1 >> ~/.ssh/known_hosts

![](../images/4.13.png)

##### 使用ssh-copy-id命令将SSH密钥添加到所有节点。

ssh-copy-id ceph-admin

ssh-copy-id mon1

ssh-copy-id osd1

ssh-copy-id osd2

##### 测试连接各节点ssh

![](../images/4.14.png)

#### 3.ceph-deploy安装

sudo yum update && sudo yum install ceph-deploy

![](../images/4.15.png)

####  4.创建集群

mkdir cluster && cd cluster

ceph-deploy new mon1

![](../images/4.16.png)

vi ceph.conf

添加:

![](../images/4.17.png)

 

#####  5.在所有节点上安装Ceph并显示ceph版本

ceph-deploy install ceph-admin mon1 osd1 osd2

![](../images/4.18.png)

ceph-deploy install mon1 

![](../images/4.19.png)

ceph-deploy install osd1 

![](../images/4.20.png)

ceph-deploy install osd2

![](../images/4.21.png)

##### 修改主机名为mon1

hostnamectl set-hostname mon1

##### 主控节点

ceph-deploy mon create-initial

![](../images/4.22.png)

ceph-deploy gatherkeys mon1

![](../images/4.23.png)

#### 为osd守护进程创建目录

##### osd节点：

sudo mkdir /var/local/osd

sudo chown ceph: /var/local/osd

##### 主控节点

将管理密钥部署到所有关联的节点。

##### 准备所有OSDS节点

ceph-deploy osd prepare osd1:/var/local/osd osd2:/var/local/osd

![](../images/4.24.png)

##### 激活OSD

ceph-deploy osd activate osd1:/var/local/osd osd2:/var/local/osd

##### 将管理密钥部署到所有关联的节点。

ceph-deploy admin ceph-admin mon1 osd1 osd2

![](../images/4.25.png)

##### 通过在所有节点上运行以下命令来更改密钥文件的权限

sudo chmod 644 /etc/ceph/ceph.client.admin.keyring

#### 6.检查集群状态

从ceph-admin节点登录到ceph监视服务器“ mon1 ”， 运行以下命令以检查集群运行状况。

ssh mon1

sudo ceph health

![](../images/4.26.png)

 

检查集群状态

sudo ceph -s

![](../images/4.27.png)