---
description: Fase 1 — Setup Seguro do Claude Code (permissões, .claude/, estrutura de pastas)
argument-hint: ""
---

# /super-power:start

Inicia a **Fase 1**: configura o ambiente onde o agente vai trabalhar.

## Pré-requisitos

Verificar se existe:
- `PLAN.md` na raiz
- `CLAUDE.md` na raiz

Se faltar, sugerir:
> "Antes de iniciar, rode `/super-power:plan` para gerar os ficheiros base."

## O que fazer

### 1. Criar `.claude/settings.json` com permissões granulares

Baseado na stack documentada em `CLAUDE.md`, crie um `settings.json` adequado:

```json
{
  "permissions": {
    "allow": [
      "Read",
      "Edit",
      "Write",
      "Glob",
      "Grep",
      "Bash(git status)",
      "Bash(git diff*)",
      "Bash(git log*)",
      "Bash(npm test*)",
      "Bash(npm run lint*)",
      "Bash(npm run build*)"
    ],
    "ask": [
      "Bash(git push*)",
      "Bash(npm install*)",
      "Bash(rm*)"
    ],
    "deny": [
      "Bash(rm -rf /*)",
      "Bash(git push --force*)",
      "Bash(:(){:|:&};:)"
    ]
  }
}
```

**Adaptar à stack do projeto:**
- Python → trocar `npm` por `pip`/`poetry`/`uv`
- Ruby → trocar por `bundle`/`rake`
- Go → trocar por `go test`/`go build`

### 2. Sugerir estrutura de pastas

Com base no PLAN.md, criar pastas vazias (com `.gitkeep` se necessário):

```
projeto/
├── src/
├── tests/
├── docs/
├── public/        (se frontend)
└── scripts/       (se aplicável)
```

**REGRA:** ZERO código de negócio nesta fase. Só pastas e ficheiros de configuração.

### 3. Inicializar git (se ainda não está)

```bash
git init
git add .
git commit -m "fase 1: setup inicial via claude-code-super-power"
```

### 4. Atualizar CLAUDE.md

Marcar Fase 1 como concluída:

```markdown
#### Fases concluídas
- [x] Fase 0 — Pesquisa
- [x] Fase 1 — Setup Seguro do Claude Code
- [ ] Fase 2 — Fundação
```

### 5. Atualizar NOW.md

```markdown
## Última sessão: YYYY-MM-DD

### O que foi feito
- Fase 1 completa: .claude/settings.json criado, estrutura inicial montada

### Próximo passo imediato
- Rodar /super-power:phase 2 para começar a Fase 2 (Fundação completa)
```

## Após executar

Mostre ao utilizador:

```
✓ Fase 1 — Setup Seguro do Claude Code concluído

  Criado:
    .claude/settings.json    — permissões granulares
    src/, tests/, docs/      — estrutura inicial
    git inicializado

Próximo passo:
  /super-power:phase 2

A Fase 2 vai expandir o CLAUDE.md para 200+ linhas com toda a lógica de negócio,
e preparar a estrutura completa antes de começar testes (Fase 3).
```

## Regras

- Para projetos de **alto risco** (produção, dados sensíveis), perguntar se quer Docker como camada extra antes de continuar
- Nunca commitar `.env` ou ficheiros com secrets
- Verificar se `.gitignore` cobre `node_modules/`, `.env`, `*.log` antes do commit inicial

## Referência

- Detalhe da Fase 1: `metodo/02-fluxo-completo.md` secção "Fase 1"
