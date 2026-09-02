# Palpo

Palpo 是一个使用 Rust 实现的 Matrix 主服务器。

## 状态

仓库目前处于 `IMPLEMENTATION` 阶段。配置服务器生命周期已经实现，但尚未
`assured`：本仓库目前不对 Matrix 兼容性、联邦行为、安全性、性能、持久化运维或
生产就绪性作出保证。在有保证记录之前，请仅将部署视为开发或评估工作。

## 本地快速开始

1. 安装 `Cargo.toml` 所要求的 Rust 工具链，并准备可访问的 PostgreSQL 数据库。
2. 复制配置模板，并编辑所有标记为需要本地输入的设置：

   ```bash
   cp palpo-example.toml palpo.toml
   ```

3. 按环境设置服务器标识、监听器、数据库和存储配置。
4. 使用显式配置路径构建并运行：

   ```bash
   cargo build --release
   ./target/release/palpo --config palpo.toml
   ```

如需容器化起点，请查看 `deploy/docker/compose.yml`，并在启动其中的 Compose
服务前于 `deploy/docker/.env` 中设置 `PALPO_POSTGRES_PASSWORD`。

## Fork 拓扑

本仓库是 https://github.com/palpo-im/palpo 的上游 Fork。

- `main` 镜像上游。
- `internal/main` 是运营主干，也是常规工作的基线。
- 只有经选择、可安全贡献给上游的分支才以 `main` 为目标；`internal/main`
  不会合并到其中。

## 权威项目记录

README 仅用于导览，不是权威架构或保证记录。

- `situation/context.md` — 当前、预期和过渡状态。
- `situation/promises/P-000001-configured-server-lifecycle.md` — 活跃的
  配置服务器承诺及其残余范围。
- `situation/oracles/O-000001-configured-server-lifecycle.md` — 判断该承诺的
  规则。
- `situation/plans/active/PLAN-000001-configured-server-assurance.md` — 获得
  保证所需的证据路径。
- `situation/decisions/` 与 `situation/invariants/` — 持久化决策和绑定的
  仓库规则。

## 贡献

提出修改前请阅读 `CONTRIBUTING.md`。常规运营工作从 `internal/main` 开始；准备
任何可安全贡献给上游的变更时，请遵守上述 Fork 拓扑。

## 许可证

Palpo 使用 Apache License 2.0 许可证。详见 `LICENSE`。

## 历史供体导览

本次 BACKPORT 保留的详细开启时导览仍可通过 Git 获取：
`5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:README.zh.md`。当前仓库知识以
`situation/` 下的记录为准。
