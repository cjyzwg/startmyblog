

class Blog {
  final String title;
  final String category;
  final String posttime;
  final String description;
  final String imageUrl;
  Blog({
    this.title,
    this.category,
    this.posttime,
    this.description,
    this.imageUrl,
  });



}


final List<Blog> bloglists = [
  Blog(
    title: 'SSH添加阿里云秘钥.md',
    category: 'SSH',
    posttime: '2019-10-17 18:04',
    description:
        '### 阿里云服务器添加秘钥 1.登录控制台，创建秘钥对，并下载为a.pem 2.ssh-keygen -y -f a.pem会返回ssh-rsa 如果该命令失败，请运行chmod 400 my-key-pair.pem命令更改权限 3.登录到服务器a.com中，echo >> ~/.ssh/authorized_keys 4.nano /etc/ssh/sshd_config P...',
    imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
  ),
  Blog(
    title: '文件比较工具diffmerge使用命令.md',
    category: 'PHP',
    posttime: '2019-10-14 13:16',
    description:
        '### diffmerge使用 > 以mac为例 http://www.sourcegear.com/diffmerge/ osx pkg版本 ##### 命令用法 > diffmerge fold1 fold2 ##### compare.sh ```shell script #!/bin/bash GetKey(){ section=dwadawda ...',
    imageUrl: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
  ),
  Blog(
    title: 'grpc_php客户端.md',
    category: 'GO',
    posttime: '2019-10-08 15:49',
    description:
        '# grpc php client **服务端取的是https://www.jianshu.com/p/7fe7a8507745 案例** #### 需要执行 > export GO111MODULE=on go mod tidy #### 安装依赖 >pecl install grpc pecl install protobuf 同时并.so 文件放进ini中，如果是在do...',
    imageUrl: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  Blog(
    title: '树莓派烧录.md',
    category: '树莓派',
    posttime: '2019-10-08 15:49',
    description:
        '参考链接：http://wangwei.info/mac-raspberrypi3-ubuntu-mate-vncserver-installation/ 1. 从官网下载镜像：ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz 2. 安装解压工具：brew install xz 3. 解压镜像： xz -help xz -d ubunt...',
    imageUrl: 'https://resources.ninghao.org/images/dragon.jpg',
  ),
];
