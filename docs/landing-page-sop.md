# 企效 AI 落地页复用 SOP

这份 SOP 记录本项目从空目录到可宣传测试页的创建和优化过程，方便后续复制更多产品验证页。

## 1. 工作区和仓库隔离

- 父目录只放本机资料和密钥。
- 开源内容放在 `repository/`。
- `secrets/`、`.env`、客户真实资料、导出数据必须被 `.gitignore` 排除。

## 2. 先做静态页

MVP 阶段优先用单个 `public/index.html`：

- 部署简单。
- 改文案快。
- 不需要构建链路。
- Cloudflare Pages 可以直接发布 `public/`。

## 3. 首屏框架

首屏必须回答：

- 我是谁：企效 AI，中小企业 AI 降本增效助手。
- 帮谁：中小企业老板。
- 解决什么：重复劳动、返工、等待、催进度。
- 怎么降低风险：免费初筛、7 天体检、14 天样板。

推荐结构：

1. Eyebrow：行业定位和内测状态。
2. H1：老板语言，不用技术词。
3. 副标题：选一个高频流程先验证。
4. CTA：免费初筛。
5. 三个信任指标：0 元、7 天、14 天。

## 4. 转化页内容顺序

当前页面顺序可以复用：

1. 首屏价值主张。
2. 老板算账：重复劳动每月浪费多少钱。
3. 替代方案对比：招人、买 SaaS、找外包、自己研究 AI，对比先做小样板。
4. 基础场景：销售、财务、运营。
5. 行业样板：贸易、财税、本地服务，每张卡写现在的问题、样板交付、验收指标、上线后变化。
6. 能力模块：知识库、工作流、RPA、看板、客户增长、风控审批。
7. 交付方式：体检、资料接入、样板闭环、复盘 ROI，并写清老板能拿到的交付包。
8. 价格和保障：免费初筛、¥680 体检、¥6,800 样板。
9. 适合/不适合：筛掉不划算需求，再给 3 分钟自检。
10. FAQ：系统、安全、员工配合、烂尾风险。
11. 内测申请流程：24 小时回复、15 分钟初筛、不催付款。
12. CTA：邮件申请和模板，告诉访客先发 4 行信息即可。

## 5. 定价心理

不要一上来卖大系统。用低风险阶梯：

- `¥0`：免费流程初筛，判断是否值得聊。
- `¥680`：7 天降本体检，可抵扣后续试点。
- `¥6,800 起`：14 天流程样板间。

邀请制要解释清楚：不是制造稀缺，而是先确认流程能交付、能验收、能省钱；不匹配直接劝退。

每档必须写：

- 适合谁。
- 交付什么。
- 如何验收。
- 退款边界。

## 6. 图片和视觉

页面不能全是文字。至少准备：

- 一张首屏商业场景图。
- 一张中段价值图，表达成本节省、信任审批、快速交付。

图片风格：

- 真实或半真实商业运营场景。
- 白、炭黑、青绿、暖橙。
- 不用机器人、科幻、紫色渐变。
- 不出现可读假文字和假 logo。

## 7. 渠道测试

页面支持 `src` 参数：

- `?src=wechat_private`
- `?src=wechat_group`
- `?src=moments`
- `?src=douyin`
- `?src=friend_referral`

邮件主题和模板会带上来源，方便手工判断哪个渠道有效。

## 8. 邮箱和垃圾邮件防护

- 页面显示邮箱，但源码不写完整明文。
- 使用 Base64 放在 `data-email`，前端加载后解码。
- 后续如果垃圾邮件变多，再换成 Cloudflare Turnstile + Pages Functions 表单。

## 9. Cloudflare Pages 发布

当前快速发布方式：

```powershell
npx wrangler pages deploy public --project-name ai-enterprise-test --branch master --commit-dirty=true
```

正式长期维护建议：

- GitHub 连接 Cloudflare Pages。
- Build command 留空。
- Output directory 使用 `public`。

注意：Cloudflare Pages 只发布 `public/` 时，页面不要链接 `../docs/`。需要展示方案文档时，链接到 GitHub 上的公开文档，或把文档复制成 `public/` 下的正式页面。

## 10. 每轮优化检查

每轮改完至少检查：

```powershell
.\scripts\check-landing.ps1
git diff --check
npx --yes playwright screenshot --viewport-size="390,844" "file:///E:/Workspace/Ai-Enterprise/repository/public/index.html" output/playwright/mobile.png
npx --yes playwright screenshot --viewport-size="1440,1000" "file:///E:/Workspace/Ai-Enterprise/repository/public/index.html" output/playwright/desktop.png
```

上线后再截线上地址：

```powershell
npx --yes playwright screenshot --viewport-size="390,1200" "https://ai-enterprise-test.pages.dev" output/playwright/cloud-mobile.png
```

## 11. 可复用提示词

生成中段视觉图时可用：

```text
Create a premium semi-realistic business illustration for a Chinese SME AI implementation landing page.
Show three connected ideas: cost savings, trusted approval controls, and fast delivery of an automation workflow sample.
Use a modern office operations workspace, documents, dashboard cards, approval checkmarks, workflow arrows, report folder, and small business team.
No readable text, no logos, no robots, no sci-fi holograms, no purple gradients.
Palette: white, charcoal, teal, muted amber, light mint.
```

## 12. 后续可扩展

- 接 Cloudflare Web Analytics。
- 接 Pages Functions 表单。
- 为不同渠道做不同 H1。
- 为每个行业样板单独做短页。
- 把 `DESIGN.md` 作为后续 AI 修改页面时的视觉合同。
