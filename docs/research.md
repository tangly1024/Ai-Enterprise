# 调研结论

日期：2026-07-20

## 结论

中小企业 AI 落地不要从“全自动智能体平台”开始。最短路径是：流程盘点 -> RAG 知识库 -> 低风险工作流自动化 -> 高风险人工审批 -> 老系统再接 RPA。

## 关键观察

- OpenAI File Search / Vector Stores 已经把文件检索、向量存储、语义和关键词检索做成托管能力，适合快速做企业知识库原型。
- Amazon Bedrock Knowledge Bases、OpenAI File Search 这类托管 RAG 降低了自建向量库和解析管线的维护成本，但私有化、成本和数据合规要单独评估。
- Microsoft Power Automate 覆盖云流程、桌面 RPA、流程挖掘和 AI Builder，适合 Microsoft 365 生态企业。
- UiPath 正在把 RPA、AI Agent、人机协同和编排合到 agentic automation 叙事里，适合更重的企业自动化交付。
- n8n 的 AI Agent 节点适合开源、轻量、自托管的 workflow MVP。
- LangGraph 的价值在于 durable execution、human-in-the-loop、流式状态和可恢复执行，适合需要可靠编排的 Agent。
- Qdrant 等向量库支持 dense + sparse hybrid search，适合后续自托管知识库提升检索质量。

## 方案选择

第一版推荐：

- 工作流：n8n 或直接写少量后端任务。
- RAG：OpenAI File Search 做托管 MVP；需要自托管时再切 Qdrant/Postgres pgvector。
- Agent 编排：简单流程先不用框架；跨步骤、可暂停、需审批时再引入 LangGraph。
- RPA：优先接现有 Power Automate Desktop / UiPath / Playwright 脚本，不在本仓库重造 RPA 引擎。

## 参考来源

- OpenAI File Search: https://developers.openai.com/api/docs/guides/tools-file-search
- OpenAI Retrieval / Vector Stores: https://developers.openai.com/api/docs/guides/retrieval
- Microsoft Power Automate: https://www.microsoft.com/en-us/power-platform/products/power-automate
- Microsoft Process Mining: https://learn.microsoft.com/en-us/power-automate/process-mining-overview
- UiPath Agentic Automation: https://www.uipath.com/automation/agentic-automation
- UiPath docs: https://docs.uipath.com/
- Amazon Bedrock Knowledge Bases: https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base.html
- n8n AI Agent node: https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent
- LangGraph overview: https://docs.langchain.com/oss/python/langgraph/overview
- LangChain Human-in-the-loop: https://docs.langchain.com/oss/python/langchain/human-in-the-loop
- Qdrant hybrid queries: https://qdrant.tech/documentation/search/hybrid-queries/
