#import "template.typ": *

// 主题颜色
#let theme-color = rgb("#26267d")
#let icon = icon.with(fill: theme-color)

// 设置图标, 来源: https://fontawesome.com/icons/
#let fa-building-columns = icon("icons/fa-building-columns.svg")
#let fa-envelope = icon("icons/fa-envelope.svg")
#let fa-github = icon("icons/fa-github.svg")
#let fa-graduation-cap = icon("icons/fa-graduation-cap.svg")
#let fa-linux = icon("icons/fa-linux.svg")
#let fa-phone = icon("icons/fa-phone.svg")
#let fa-windows = icon("icons/fa-windows.svg")

// 设置简历选项与头部
#show: resume.with(
  // 字体和基准大小
  size: 9.6pt,
  font: (
    main: "Source Han Sans SC",
    mono: "Consolas",
    cjk: "Source Han Sans SC",
  ),
  // 标题颜色
  theme-color: theme-color,
  // 控制纸张的边距
  margin: (
    top: 1.2cm,
    bottom: 1.2cm,
    left: 1.4cm,
    right: 1.4cm,
  ),

  // 如果需要姓名及联系信息居中，请删除下面关于头像的三行参数，并取消header-center的注释
  //header-center: true,

  // 如果不需要头像，则将下面三行的参数注释或删除
  photograph: "profile.png",
  photograph-width: 8em,
  gutter-width: 2em,
)[
  = 李忠鹏

  #v(0.3em)
  #info(
    color: theme-color,
    (
      icon: fa-building-columns,
      content: "河北工程大学",
    ),
    (
      icon: fa-graduation-cap,
      content: "软件工程",
    ),
    (
      icon: fa-phone,
      content: "17532597005",
    ),
    (
      icon: fa-envelope,
      content: "lizhongpeng2@gmail.com",
      link: "mailto:lizhongpeng2@gmail.com",
    ),
    (
      icon: fa-github,
      content: "zhongpengdev",
      link: "https://github.com/zhongpengdev",
    ),
  )

  #v(-0.2em)
  #text(size: 0.95em, fill: rgb(80, 80, 80))[
    GPA: 3.78 / 4.2 (25%) #h(1.5em) 英语六级 (CET-6)
  ]
  #v(0.4em)
][
  #h(2em)

热爱计算机技术，具备较为扎实的计算机理论基础知识，系统学习和熟悉了计算机组成原理、操作系统等核心调度模块与常见网络协议；具备较为扎实的编程基础，熟悉常见数据结构，具备良好的开发习惯及前后端模块化交付能力。
]



== 专业技能

  - 常用 Python 进行开发，掌握常见切片 (Slice) 与内置数据结构，熟悉高阶函数及装饰器等特性，了解协程与 GIL 机制。

  - 熟悉 FastAPI Web 框架，具备基于 asyncio 的异步开发能力与 WebSockets 编程经验。

  - 熟悉Linux常见运维命令与Docker容器化技术，具备使用Docker部署服务和应用的能力。

  - 熟悉Git常见命令与代码流管理，具备日常多分支协同及代码冲突解决与合并的能力。

  - 了解Vue3框架、JavaScript，以及使用Vite等构建工具及npm包管理工具。


== 获奖情况

#item(
  [ *全国大学生物理实验竞赛* ],
  [ *全国一等奖* ],
  date[ 2025 年 12 月 ],
  note: [ 负责软件系统开发，基于 PyQt 与 OpenCV 搭建图像处理与交互软件，设计和调优了圆心识别算法。 ],
)

#item(
  [ *亚太杯大学生数学建模比赛* ],
  [ *铜奖* ],
  date[ 2024 年 12 月 ],
  note: [ 基于 OpenCV 对水下退化图像去噪与质量优化，参与水下图像退化模型的物理建模过程与推导。 ],
)

== 项目经历

#item(
  link(
    "https://github.com/zhongpengdev/communitys-agent-banked-py",
    [ *某社区平台智能服务系统后端* ],
  ),
  [ *团队项目* ],
  date[ 2026 年 01 月 – 2026 年 06 月 ],
)

#tech[ FastAPI, Asyncio, WebSocket, Redis, PostgreSQL ]

基于 FastAPI 与 Claude Agent SDK 开发的生产级工具编排与业务处理后端。向下管理多个 MCP 的工具链，向上基于 WebSocket 交付双向流式对话与动态工具路由执行环境。

- #strong[长连接流式通信]：基于 WebSocket 协议与异步连接管理器，实现 Thinking 状态与文本数据块的无延迟双向流式下发，提升密集交互场景下的前端响应体验。

- #strong[高性能 HTTP 会话连接池]：封装单例管理器统一托管 `aiohttp` 会话，通过并发连接限额与 DNS 动态缓存策略，实现高频工具调用下的 Keep-Alive 长连接复用，消除频繁建连的握手时延。

- #strong[协程级多租户状态隔离]：利用 Python 原生 `ContextVars` 构建无状态协程本地存储，在长连接入口层动态绑定 JWT 凭证，确保并发调度切换下的租户数据独立，使底层松耦合的 MCP 工具链实现免传参的隐式链式鉴权。

- #strong[分层记忆架构与异步持久化]：基于 Redis Pipeline 与 `LTRIM` 机制维护 10 条消息滑动窗口，保障热记忆的高效读写；设计冷启动数据查询与回写缓存方案，并利用 `asyncio.to_thread` 将 SQLAlchemy 同步落盘移交独立线程池，避免主事件循环阻塞。

- #strong[标准化日志管道]：统一拦截并重定向 `Uvicorn/FastAPI/SQLAlchemy` 等标准库的日志流量；生产环境输出单行结构化 JSON 以对接日志收集系统，并关闭深度诊断模式以防止调用栈异常中泄露敏感变量。

#item(
  link(
    "https://github.com/zhongpengdev/fringe-counting-qt",
    [ *迈克尔逊干涉条纹计数软件* ],
  ),
  [ *独立开发* ],
  date[ 2025 年 03 月 – 2025 年 09 月 ],
)

#tech[ Python, PyQt6, OpenCV, NumPy, PyTorch ]

该系统为2025年全国大学生物理实验竞赛一等奖核心算法与控制端，是一款图像处理与自动计数桌面软件。

- #strong[分层结构与组件解耦]：将系统解耦为表现层、控制层、工作线程层与算法接口层；使用 PyQt6 信号槽实现数据通信与事件驱动，切断业务逻辑对 GUI 控件的直接依赖，提高工程可维护性。

- #strong[多工作线程并发]：针对视频流实时解码（I/O 密集型）与长视频波形解算（CPU 密集型）场景，将所有耗时数据采集与模型推理托管至后台工作线程，主 UI 仅负责轻量级画布刷新，确保界面稳定响应。

- #strong[设计并实现圆心定位算法]：基于 Canny 算子提取条纹边缘并计算圆环梯度方向，使边缘点沿法线方向在预设半径内进行累加投票得出圆心；调优了动态二值化阈值、连通域面积阈值及 Canny 算子双阈值等关键参数，提高算法精度。


