---
name: 企效 AI landing page
colors:
  primary: "#0b766f"
  background: "#f7faf8"
  text: "#17211f"
  ink: "#17211f"
  muted: "#5d6865"
  paper: "#f7faf8"
  white: "#ffffff"
  teal: "#0b766f"
  tealDark: "#084f4b"
  amber: "#d98b1f"
  mint: "#dff3ee"
  rose: "#f3e5dc"
typography:
  family: Microsoft YaHei, PingFang SC, Segoe UI, Arial, sans-serif
rounded:
  card: 8px
  button: 8px
spacing:
  pageMax: 1120px
  sectionY: 72px
components:
  card:
    backgroundColor: "#ffffff"
    textColor: "#17211f"
    rounded: 8px
    padding: 22px
  button:
    backgroundColor: "#0b766f"
    textColor: "#ffffff"
    rounded: 8px
    height: 44px
---

# Overview

企效 AI 的页面面向中小企业老板，不面向技术采购。视觉要像“可信的降本增效服务”，不是炫技型 AI 平台。页面应让访客快速理解三件事：能省什么、怎么交付、风险如何控制。

# Layout

页面使用紧凑居中的版心，最大宽度控制在 `1120px` 附近。桌面端左右留白要明显，不要横向铺满。移动端保持单列阅读，不使用横向滚动表格。

# Visual Direction

使用真实或半真实商业运营图片：办公室、文档、流程卡片、审批、报告、看板。避免机器人、赛博朋克、紫色渐变、夸张科幻。图片承担“产品价值、信任感、交付便捷”的快速引导，不做纯装饰。

# Copywriting

首屏优先讲老板语言：少招人、少返工、少催进度、省下重复岗位时间。避免一开始堆 RAG、Agent、RPA。技术词只出现在能力模块里，并且必须配业务解释。

# Components

卡片用于能力模块、价格、FAQ、场景样板。每张卡只表达一个购买理由。按钮文案要短，优先使用“免费初筛”“申请体检”“申请样板”。

# Do's

- 先讲 ROI 和重复劳动成本。
- 每个价格都写交付结果和保障。
- 所有高风险动作都强调人工确认。
- 用 `src` 参数区分推广渠道。
- 邮箱使用前端解码，源码不明文暴露完整地址。

# Don'ts

- 不承诺“全公司一键 AI 化”。
- 不伪造客户案例。
- 不让老板一上来背大预算。
- 不把页面写成技术白皮书。
- 不用横向过宽的版式。
