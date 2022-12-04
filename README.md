# NodeJS metrics app example

NodeJS示例程序，用于演示简单演示由Prometheus抓取应用内建指标的功能。

### 启动服务

安装好nodejs，直接使用node命令启动即可。

```
node src/myserver.js
```

### 部署到Kubernetes之上

需要事先将deployment-metrics-app.yaml文件中的“\__IMAGE__”替换为具体使用的镜像文件，例如“ikubernetes/metrics-app:v0.1”等。

```
kubectl apply -f deploy/
```

### 文件简要说明

- Jenkinsfile：Jenkins Pipeline的示例定义，支持Sonar的代码质量扫描、制作Docker Image并完成镜像推送；
- Dockerfile：Docker Build示例配置文件；

## iKubernetes公众号

![ikubernetes公众号二维码](https://github.com/iKubernetes/Kubernetes_Advanced_Practical_2rd/raw/main/imgs/iKubernetes%E5%85%AC%E4%BC%97%E5%8F%B7%E4%BA%8C%E7%BB%B4%E7%A0%81.jpg)

## 《Kubernetes进阶实战第2版》

- [淘宝直达](https://s.taobao.com/search?q=kubernetes%E8%BF%9B%E9%98%B6%E5%AE%9E%E6%88%98%E7%AC%AC2%E7%89%88&imgfile=&commend=all&ssid=s5-e&search_type=item&sourceId=tb.index&spm=a21bo.2017.201856-taobao-item.1&ie=utf8&initiative_id=tbindexz_20170306)
- [京东商城直达](https://search.jd.com/Search?keyword=kubernetes%E8%BF%9B%E9%98%B6%E5%AE%9E%E6%88%98%E7%AC%AC2%E7%89%88&enc=utf-8&suggest=2.def.0.base&wq=kubernetes%E8%BF%9B%E9%98%B6%E5%AE%9E%E6%88%98&pvid=286ff777931e4075a762f321a0fb1139)
- [当当直达](http://search.dangdang.com/?key=kubernetes%BD%F8%BD%D7%CA%B5%D5%BD%B5%DA%B6%FE%B0%E6&act=input)

![图书封面](https://github.com/iKubernetes/Kubernetes_Advanced_Practical_2rd/raw/main/imgs/book.jpg)


## 版权声明
本文档由[马哥教育](www.magedu.com)开发，允许自由转载，但必须保留马哥教育及相关的一切标识。另外，商用需要征得马哥教育的书面同意。
