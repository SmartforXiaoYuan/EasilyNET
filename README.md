### EasilyNET

[![License][1]][2] ![ISSUES][3] ![FORKS][4] ![STARS][5] ![Commit Activity][6] ![Last Commit][7]

<p align="center">
    <img src="https://repobeats.axiom.co/api/embed/cd2c97db26ee6fe230353beefd5d532448054f0a.svg" />
</p>

**注意:** 由于本项目一般会试用和支持最新版本的.NET SDK,所以为了保证你能正常编译,请确保运行之前安装当前最新版本的 SDK

**解决 git 不区分大小**

```bash
git config core.ignorecase false
```

- 使用 docker-compose 启动 MongoDB 副本集集群,使用本项目中的 yml 文件启动 MongoDB 副本集集群

```bash
docker compose -f docker-compose.mongo.rs.yml up -d
```

- 若要测试本项目,请启动如下服务,若想测试 MongoDB 则需启动上述 MongoDB 服务

```bash
docker compose -f docker-compose.basic.service.yml up -d
```

- 目前包含的服务列表如下:

| 服务名称        | 服务描述   | 端口映射   | 镜像名称                                                 |
| --------------- | ---------- | ---------- | -------------------------------------------------------- |
| Garnet          | 替代 Redis | 3278       | ghcr.io/joesdu/garnet:latest                             |
| RabbitMQ        | 消息队列   | 15672,5672 | ghcr.io/joesdu/rabbitmq-dlx:latest                       |
| AspireDashboard | 可观测性   | 18888,4317 | mcr.microsoft.com/dotnet/nightly/aspire-dashboard:latest |

EasilyNET Packages

- AES,DES,RC4,TripleDES,RSA,SM2,SM3,SM4 加密,验签等算法
- 基于 MongoDB 的分布式锁
- 基于 RabbitMQ 的消息总线实现
- 对 MongoDB 驱动的一些封装,方便使用以及一些常用的默认配置
- 雪花 ID,一些常用的数据类型,枚举,扩展方法等
- 自动模块化注入服务,新增支持 WPF,WinForm 等项目,需使用 IHost 通用主机模式
- MongoDB 添加 DateOnly 和 TimeOnly 的支持(序列化到 String 或 long), dynamic 类型支持
- MongoDB GridFS 用法的简单支持(常用用法)和使用案例.
- 在 WebAPI 中集成一些常见的过滤器和中间件
- 对 Swagger 文档添加分组,隐藏 API 和添加部分数据类型默认值显示的支持,方便前端工程师查阅
- 对 MongoDB 执行命令添加个性化输出,以及 Diagnostics 数据到 APM.(EasilyNET.Mongo.ConsoleDebug)
- 部分库的[使用案例](./sample/WebApi.Test.Unit/README.md)

<details> 
<summary style="font-size: 14px">English</summary>

- AES,DES,RC4,TripleDES,RSA,SM2,SM3,SM4 encryption, signature verification and other algorithms.
- Distributed locks based on MongoDB.
- Message bus implementation based on RabbitMQ.
- Some encapsulation of MongoDB driver for easy use and some common default configurations.
- Snowflake ID, some common data types, enumerations, extension methods, etc.
- Automatic modular injection services, adding support for WPF, WinForm and other projects, using IHost common host mode.
- Added support for DateOnly and TimeOnly in MongoDB(serialized to String or long), dynamic type support.
- Simple support for MongoDB GridFS usage (common usage) and usage examples.
- Integration of some common filters and middleware in WebAPI.
- Added support for grouping, hiding APIs, and displaying default values for some data types in Swagger documents, making it easier for front-end engineers to refer to.
- Added personalized output for executing MongoDB commands, Diagnostics datas to APM (EasilyNET.Mongo.ConsoleDebug).
- [Usage examples](./sample/WebApi.Test.Unit/README.md) of some libraries.

</details>

#### 近期更新内容(Recent Updates)

- 同步更新 MongoDB 3.0.0 驱动程序,同步删除过时 API
- 合并 EasilyNET.MongoGridFS.AspNetCore, EasilyNET.MongoSerializer.AspNetCore 到 EasilyNET.Mongo.AspNetCore

<details> 
<summary style="font-size: 14px">English</summary>

- Synchronized update to MongoDB 3.0.0 driver, removed deprecated APIs
- Merged EasilyNET.MongoGridFS.AspNetCore and EasilyNET.MongoSerializer.AspNetCore into EasilyNET.Mongo.AspNetCore

</details>

#### Core

| NuGet Package                   | Version      | Download     | Document                                          |
| ------------------------------- | ------------ | ------------ | ------------------------------------------------- |
| [EasilyNET.Core][8]             | ![Nuget][9]  | ![Nuget][10] | [文档](./src/EasilyNET.Core/README.md)            |
| [EasilyNET.WebCore][14]         | ![Nuget][15] | ![Nuget][16] | [文档](./src/EasilyNET.WebCore/README.md)         |
| [EasilyNET.WebCore.Swagger][17] | ![Nuget][18] | ![Nuget][19] | [文档](./src/EasilyNET.WebCore.Swagger/README.md) |

#### Framework

| NuGet Package                           | Version      | Download     | Document                                                  |
| --------------------------------------- | ------------ | ------------ | --------------------------------------------------------- |
| [EasilyNET.AutoDependencyInjection][20] | ![Nuget][21] | ![Nuget][22] | [文档](./src/EasilyNET.AutoDependencyInjection/README.md) |
| [EasilyNET.ExpressMapper][23]           | ![Nuget][24] | ![Nuget][25] | [文档](./src/EasilyNET.ExpressMapper/README.md)           |
| [EasilyNET.RabbitBus.AspNetCore][26]    | ![Nuget][27] | ![Nuget][28] | [文档](./src/EasilyNET.RabbitBus.AspNetCore/README.md)    |
| [EasilyNET.Security][29]                | ![Nuget][30] | ![Nuget][31] | [文档](./src/EasilyNET.Security/README.md)                |

#### Mongo

| NuGet Package                                   | Version      | Download     | Document                                                          |
| ----------------------------------------------- | ------------ | ------------ | ----------------------------------------------------------------- |
| [EasilyNET.Mongo.AspNetCore][32]                | ![Nuget][33] | ![Nuget][34] | [文档](./src/EasilyNET.Mongo.AspNetCore/README.md)                |
| [EasilyNET.Mongo.ConsoleDebug][35]              | ![Nuget][36] | ![Nuget][37] | [文档](./src/EasilyNET.Mongo.ConsoleDebug/README.md)              |
| [EasilyNET.MongoDistributedLock][38]            | ![Nuget][39] | ![Nuget][40] | [文档](./src/EasilyNET.MongoDistributedLock/README.md)            |
| [EasilyNET.MongoDistributedLock.AspNetCore][41] | ![Nuget][42] | ![Nuget][43] | [文档](./src/EasilyNET.MongoDistributedLock.AspNetCore/README.md) |

#### 感谢 [JetBrains](https://www.jetbrains.com/shop/eform/opensource) 对本项目的支持!

<img src="https://www.jetbrains.com/shop/static/images/jetbrains-logo-inv.svg" height="100">

## 如何为本项目做出贡献

- Fork 本项目到你自己的仓库.
- 创建一个属于你自己的分支,名字随便你怎么取.
- 然后提交代码到你自己仓库的分支上.
- 然后到本项目创建一个 PR.
- 等待管理员合并 PR 后即可删除掉你自己的仓库.

<!--文档中的各项链接-->

[1]: https://img.shields.io/badge/License-MIT-brightgreen.svg
[2]: LICENSE
[3]: https://img.shields.io/github/issues/EasilyNET/EasilyNET
[4]: https://img.shields.io/github/forks/EasilyNET/EasilyNET
[5]: https://img.shields.io/github/stars/EasilyNET/EasilyNET
[6]: https://img.shields.io/github/commit-activity/y/EasilyNET/EasilyNET
[7]: https://img.shields.io/github/last-commit/EasilyNET/EasilyNET
[8]: https://www.nuget.org/packages/EasilyNET.Core
[9]: https://img.shields.io/nuget/v/EasilyNET.Core
[10]: https://img.shields.io/nuget/dt/EasilyNET.Core
[14]: https://www.nuget.org/packages/EasilyNET.WebCore
[15]: https://img.shields.io/nuget/v/EasilyNET.WebCore
[16]: https://img.shields.io/nuget/dt/EasilyNET.WebCore
[17]: https://www.nuget.org/packages/EasilyNET.WebCore.Swagger
[18]: https://img.shields.io/nuget/v/EasilyNET.WebCore.Swagger
[19]: https://img.shields.io/nuget/dt/EasilyNET.WebCore.Swagger
[20]: https://www.nuget.org/packages/EasilyNET.AutoDependencyInjection
[21]: https://img.shields.io/nuget/v/EasilyNET.AutoDependencyInjection
[22]: https://img.shields.io/nuget/dt/EasilyNET.AutoDependencyInjection
[23]: https://www.nuget.org/packages/EasilyNET.ExpressMapper
[24]: https://img.shields.io/nuget/v/EasilyNET.ExpressMapper
[25]: https://img.shields.io/nuget/dt/EasilyNET.ExpressMapper
[26]: https://www.nuget.org/packages/EasilyNET.RabbitBus.AspNetCore
[27]: https://img.shields.io/nuget/v/EasilyNET.RabbitBus.AspNetCore
[28]: https://img.shields.io/nuget/dt/EasilyNET.RabbitBus.AspNetCore
[29]: https://www.nuget.org/packages/EasilyNET.Security
[30]: https://img.shields.io/nuget/v/EasilyNET.Security
[31]: https://img.shields.io/nuget/dt/EasilyNET.Security
[32]: https://www.nuget.org/packages/EasilyNET.Mongo.AspNetCore
[33]: https://img.shields.io/nuget/v/EasilyNET.Mongo.AspNetCore
[34]: https://img.shields.io/nuget/dt/EasilyNET.Mongo.AspNetCore
[35]: https://www.nuget.org/packages/EasilyNET.Mongo.ConsoleDebug
[36]: https://img.shields.io/nuget/v/EasilyNET.Mongo.ConsoleDebug
[37]: https://img.shields.io/nuget/dt/EasilyNET.Mongo.ConsoleDebug
[38]: https://www.nuget.org/packages/EasilyNET.MongoDistributedLock
[39]: https://img.shields.io/nuget/v/EasilyNET.MongoDistributedLock
[40]: https://img.shields.io/nuget/dt/EasilyNET.MongoDistributedLock
[41]: https://www.nuget.org/packages/EasilyNET.MongoDistributedLock.AspNetCore
[42]: https://img.shields.io/nuget/v/EasilyNET.MongoDistributedLock.AspNetCore
[43]: https://img.shields.io/nuget/dt/EasilyNET.MongoDistributedLock.AspNetCore
