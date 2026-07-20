# Cloudflare Pages 部署建议

推荐用 Cloudflare Pages 的 GitHub 集成部署这个落地页。

## 为什么

- 当前页面是纯静态文件，不需要服务器。
- GitHub 推送后自动发布，适合快速改文案、价格和转化路径。
- Cloudflare Pages 支持连接 GitHub 仓库自动部署，也支持 Direct Upload 手动上传预构建文件。
- 以后要接表单、预约、A/B 测试或接口时，再加 Pages Functions / Workers。

## Pages 配置

- Repository: `tangly1024/Ai-Enterprise`
- Branch: `master`
- Framework preset: `None`
- Build command: 留空
- Build output directory: `public`

## 流量策略

当前产品还在研讨和内测阶段，不建议直接收款。

统一口径：

> 我们现在是内测邀请制，先看你的流程是否适合自动化。不适合会直接说明；适合再进入试点，不需要马上付款。每个付费阶段都会先写清交付结果和退款边界。

这样能同时应对：

- 公域流量：降低购买压力，提升咨询率。
- 私域流量：给熟人客户一个合理缓冲，不显得强销售。
- 不成熟需求：避免承诺过度，先筛选流程质量。

## 后续再加

- Cloudflare Web Analytics：看访问量、来源、页面停留。
- 表单：先用 mailto，验证有咨询后再接 Tally / Feishu / Pages Functions。
- 自定义域名：确认命名后再绑定，避免早期频繁换品牌。
