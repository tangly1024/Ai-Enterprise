# 安全与密钥

## 仓库规则

- 真实密钥不进入 Git。
- 真实客户资料不进入 Git。
- `.env.example` 只能放空值或示例值。
- 公开 demo 使用脱敏数据。

## 本地目录

父目录 `E:\Workspace\Ai-Enterprise` 可以放本机私有资料：

- `secrets/`
- `credentials/`
- `private/`

这些目录不要放进 `repository/`。

## 企业数据

- 每个客户独立 namespace 或独立向量库。
- 文档要记录版本、有效期、权限级别。
- 对外回复、合同、付款、删除动作必须人工审批。
- 审计日志保存：输入、检索来源、模型输出、执行动作、审批人、时间。

## 最小权限

- API key 按环境区分。
- RPA 账号只给必要权限。
- 工具调用要白名单，不让模型自由执行任意命令。
- 删除、付款、发信等动作默认需要审批。

## 发布前检查

```powershell
git status --short
git diff --cached
git grep -n "sk-" HEAD -- . 2>$null
git grep -n "BEGIN .*PRIVATE KEY" HEAD -- . 2>$null
```
