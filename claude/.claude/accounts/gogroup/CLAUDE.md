# Instruções globais

## Scratchpad e /tmp ficam na RAM

Nesta máquina o `/tmp` é tmpfs: tudo que vai para lá, inclusive o scratchpad da sessão (`/tmp/claude-<uid>/...`), ocupa RAM até ser apagado. Use para arquivos pequenos e descartáveis (logs, diffs, saídas, scripts curtos).

Não coloque no scratchpad nem em outro lugar do `/tmp`:
- clones ou cópias de repositórios;
- `node_modules`, `bun/npm/pnpm install` ou cache de pacotes (fora do disco o bun não faz hardlink e copia tudo);
- bancos de dados, dumps ou datasets grandes.

Para rodar outro branch, uma PR ou um merge local sem mexer no checkout principal, use `git worktree add` dentro de `.claude/worktrees/` do próprio repo, que fica no disco, e remova o worktree ao terminar. Isso vale também para subagentes.
