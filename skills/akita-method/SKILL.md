---
name: akita-method
description: "Método estruturado para criar e executar projetos Claude Code com disciplina de engenharia sénior. Combina os 4 princípios anti-erro de Karpathy/Anthropic, o Akita Way (Anti-Vibe Coding + XP), e ferramentas auxiliares (Context7, LLM Council, Graphify). ACIONAR para 2 cenários: (1) GESTÃO DA SKILL — utilizador quer instalar, actualizar, desinstalar, limpar backups, ou ver versão. Triggers: 'atualiza super power', 'actualiza super power', 'desinstala super power', 'remove super power', 'apaga super power', 'limpa backups super power', 'limpa lixo super power', 'remove backups antigos', 'qual versão super power', 'que versão tenho', 'qual a versão', 'reinstala super power', 'update super power', 'uninstall super power', 'version super power'. Quando detectar trigger de gestão, mapear para slash command equivalente (/super-power:update, /super-power:uninstall, /super-power:uninstall backups-only, /super-power:version) e executar Bash inline directo. (2) FLUXO DE PROJETO — utilizador quer começar projeto novo ou reestruturar existente. Triggers: 'novo projeto', 'começar do zero', 'criar um site', 'montar uma aplicação', 'CLAUDE.md', 'PLAN.md', 'TDD com IA', 'pair programming com IA', 'método Akita', '/super-power:*'."
---

# Akita Method — Skill Orquestradora

Método para criar projetos Claude Code do zero à produção com disciplina de engenharia sénior. Anti-Vibe Coding: o agente nunca lidera, executa sob controlo do humano.

> **"O dev monta o esqueleto. A IA coloca os órgãos."** — Fábio Akita

---

## ⚠️ Quando o utilizador tem dificuldade em INSTALAR / ACTUALIZAR / DESINSTALAR

Se o utilizador disser que algo está bloqueado ("permission denied", "auto mode classifier denied", "blocked"), **NÃO insistas em scripts inline** que vão falhar pelo mesmo motivo. Redirecciona para uma das 3 soluções comprovadas:

### Solução 1 (RECOMENDADA — sem auto-mode bloqueio): Plugin Marketplace

Pedir ao utilizador para colar **dentro do Claude Code**:

```
/plugin marketplace add johnnyhelder/claude-code-super-power
/plugin install claude-code-super-power
```

Plugins têm permissões pre-aprovadas pelo Claude Code — passam o classifier sem fricção. Esta é a forma "oficial".

### Solução 2 (sempre funciona): Terminal externo

Pedir ao utilizador para abrir Terminal.app (macOS) / gnome-terminal (Linux) / Git Bash (Windows) — **fora do Claude Code** — e correr:

```bash
cd <pasta-do-projeto>
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

### Solução 3 (workaround rápido): Aprovação explícita

Pedir ao utilizador para colar no Claude Code:

```
Aprovo explicitamente. Podes fazer cp para .claude/skills/akita-method
e .claude/commands/super-power. Procede.
```

Geralmente passa o classifier com aprovação explícita.

### Regra ouro: nunca uses paths absolutos hardcoded

**Não tentes:** `/Users/johnny/Projetos/...` ou `/home/utilizador/...`. Estes paths assumem sistema operativo e quebram noutras máquinas (Mac vs Linux vs WSL).

**Usa sempre:** `$(pwd)`, `$HOME`, `~/.claude/`. Funciona em qualquer máquina.

---

## Filosofia (lembrar SEMPRE)

1. **Disciplina > Intuição** — não aceitar código sem entender
2. **TDD obrigatório** — testes ANTES do código
3. **Pair Programming** — humano = navegador (quê + porquê), IA = piloto (como)
4. **Desapego do código** — se a IA erra, documentar e re-promptar, NUNCA corrigir à mão
5. **Documentação viva** — `CLAUDE.md` atualizado a cada erro/decisão
6. **One-shot é mito** — cada prompt é um commit versionado

E os **4 Princípios Universais** (Karpathy + Anthropic, ver `principios/`):
1. Pensar antes de codar
2. Simplicidade primeiro
3. Mudanças cirúrgicas
4. Execução orientada por objetivo

Estes 4 são injetados automaticamente no `CLAUDE.md` de cada projeto.

---

## Quando esta Skill é acionada

- Utilizador chama qualquer `/super-power:*` slash command
- Utilizador menciona criar/reestruturar projeto
- Utilizador pede ajuda para planear antes de programar
- Qualquer cenário onde o agente vai gerar código para um projeto

---

## Gestão da Skill — Linguagem Natural

Quando o utilizador disser qualquer destes em PT-BR / PT-PT / EN, **executar Bash inline directo** sem invocar scripts externos. Isto evita problemas de cache, parser, TTY.

### Intent: ATUALIZAR / Reinstalar versão mais recente

Triggers: "atualiza", "actualiza", "upgrade", "nova versão", "instala de novo", "update super power"

```bash
TS=$(date +%s)
[ -d "$HOME/.claude/skills/akita-method" ] && \
  mv "$HOME/.claude/skills/akita-method" "$HOME/.claude/skills/akita-method.backup.$TS"
[ -d "$HOME/.claude/commands/super-power" ] && \
  mv "$HOME/.claude/commands/super-power" "$HOME/.claude/commands/super-power.backup.$TS"

TMP=$(mktemp -d)
git clone --depth 1 --quiet https://github.com/johnnyhelder/claude-code-super-power.git "$TMP/repo"
cp -r "$TMP/repo/skills/akita-method" "$HOME/.claude/skills/akita-method"
cp -r "$TMP/repo/commands" "$HOME/.claude/commands/super-power"
rm -rf "$TMP"
```

Reportar: "✓ Atualizado. Backup da versão anterior em `~/.claude/skills/akita-method.backup.$TS`."

### Intent: DESINSTALAR

Triggers: "desinstala", "remove", "apaga", "tira", "uninstall"

**Perguntar primeiro qual modo:**

```
Como queres desinstalar?

  1. SOFT (recomendado) — move para .deleted.<timestamp>, recuperável
  2. HARD — apaga definitivamente
  3. CLEAN-ALL — apaga tudo + remove backups antigos acumulados

Responde 1, 2 ou 3.
```

Após resposta, executar Bash directo:

**SOFT:**
```bash
TS=$(date +%s)
mv "$HOME/.claude/skills/akita-method" "$HOME/.claude/skills/akita-method.deleted.$TS" 2>/dev/null
mv "$HOME/.claude/commands/super-power" "$HOME/.claude/commands/super-power.deleted.$TS" 2>/dev/null
```

**HARD:**
```bash
rm -rf "$HOME/.claude/skills/akita-method"
rm -rf "$HOME/.claude/commands/super-power"
```

**CLEAN-ALL** (Hard + apagar todos os backups acumulados):
```bash
rm -rf "$HOME/.claude/skills/akita-method"
rm -rf "$HOME/.claude/commands/super-power"
find "$HOME/.claude/skills" "$HOME/.claude/commands" -maxdepth 1 -type d \
  \( -name "akita-method.backup.*" -o -name "akita-method.deleted.*" \
     -o -name "super-power.backup.*" -o -name "super-power.deleted.*" \) \
  -exec rm -rf {} + 2>/dev/null
```

### Intent: LIMPAR BACKUPS ACUMULADOS

Triggers: "limpa backups", "limpa lixo", "tira os backups", "remove backups antigos"

```bash
N=$(find "$HOME/.claude/skills" "$HOME/.claude/commands" -maxdepth 1 -type d \
  \( -name "akita-method.backup.*" -o -name "akita-method.deleted.*" \
     -o -name "super-power.backup.*" -o -name "super-power.deleted.*" \) \
  2>/dev/null | wc -l | tr -d ' ')
find "$HOME/.claude/skills" "$HOME/.claude/commands" -maxdepth 1 -type d \
  \( -name "akita-method.backup.*" -o -name "akita-method.deleted.*" \
     -o -name "super-power.backup.*" -o -name "super-power.deleted.*" \) \
  -exec rm -rf {} + 2>/dev/null
echo "✓ $N backups antigos apagados."
```

### Intent: VER VERSÃO

Triggers: "qual versão", "que versão tenho", "version"

```bash
[ -f "$HOME/.claude/skills/akita-method/SKILL.md" ] && \
  echo "✓ Skill instalada: $(stat -c %y "$HOME/.claude/skills/akita-method/SKILL.md" 2>/dev/null || stat -f %Sm "$HOME/.claude/skills/akita-method/SKILL.md")" || \
  echo "✗ Skill não está instalada."

[ -d "$HOME/.claude/commands/super-power" ] && \
  echo "✓ Slash commands: $(ls "$HOME/.claude/commands/super-power" | wc -l) ficheiros" || \
  echo "✗ Slash commands não instalados."
```

### Regras de gestão

- **Sempre confirmar** antes de operações destrutivas (HARD / CLEAN-ALL)
- **Reportar resultado** com paths concretos (utilizador deve saber onde está o backup)
- **Não invocar `uninstall.sh` ou `install.sh`** — fazer Bash inline aqui mesmo
- **Detectar plataforma** quando relevante (macOS vs Linux vs WSL — `stat -c` vs `stat -f`)

---

## Os 8 slash commands principais

A Skill orquestra os comandos. Detalhes em cada ficheiro `.md`:

| Comando | Faz |
|---------|-----|
| `/super-power:research` | Fase 0 — briefing conversacional + 7 perguntas + pesquisa deep automática |
| `/super-power:plan` | Consolida pesquisa em PLAN.md + CLAUDE.md + PROJECT.md + NOW.md (com framework de marketing digital) |
| `/super-power:start` | Fase 1 — setup seguro (`.claude/settings.json`, estrutura) |
| `/super-power:phase N` | Avança para a Fase N (2-7) com regras específicas |
| `/super-power:status` | Lê CLAUDE.md + NOW.md e resume estado do projeto |
| `/super-power:version` | Mostra versão da skill instalada + backups acumulados + versão remota |
| `/super-power:update` | Atualiza para a versão mais recente (com backup automático) |
| `/super-power:uninstall [modo]` | Remove (soft / hard / clean-all / backups-only) |

**Linguagem natural sempre disponível:** o utilizador pode dizer "atualiza super power", "desinstala isto", "limpa backups", "qual versão tenho" — a skill reconhece os triggers e age. Ver secção "Gestão da Skill — Linguagem Natural" acima.

---

## Fluxo Completo (8 fases)

### Fase 0 — Pesquisa
Briefing conversacional + 7 perguntas + pesquisa deep automática (mercado, persona, concorrência, SEO, envolvidos). **Tudo dentro do Claude Code.**
- Comando: `/super-power:research`
- Saída: `pesquisas/00-deep-research.md` (1 ficheiro consolidado, ~5-15 páginas)
- Opção alternativa: gerar prompt para Gemini Deep Research e importar de volta

### Fase 1 — Setup Seguro do Claude Code
Configurar `.claude/settings.json` com permissões, criar estrutura de pastas, inicializar git. ZERO código.
- Comando: `/super-power:start`

### Fase 2 — Fundação
`PLAN.md` + `CLAUDE.md` (200+ linhas) totalmente preenchidos. Todas as variáveis de ambiente. Todas as integrações documentadas.
- Comando: `/super-power:phase 2`

### Fase 3 — Testes (TDD Puro)
Escrever TODOS os testes ANTES da implementação. Categorias: build, funcionalidade, segurança, qualidade, integração.
- Comando: `/super-power:phase 3`
- Regra: todos os testes devem FALHAR (Red) antes da implementação

### Fase 4 — Implementação
Código guiado pelos testes. Feature por feature. Após cada feature, rodar testes.
- Comando: `/super-power:phase 4`

### Fase 5 — Otimização
Performance, refactoring, quebrar ficheiros grandes. Considerar `/graphify .` para visualizar arquitectura.
- Comando: `/super-power:phase 5`

### Fase 6 — Interface
Polir camada de apresentação (frontend/CLI/bot/API docs).
- Comando: `/super-power:phase 6`

### Fase 7 — Deploy + CI/CD
Pipeline automatizada: lint → testes → build → deploy.
- Comando: `/super-power:phase 7`

---

## Regras Transversais (aplicar SEMPRE)

### Desapego do Código
Se a IA gera código errado:
1. NÃO corrigir manualmente
2. Explicar o erro no prompt
3. Documentar em "Erros Conhecidos da IA" no CLAUDE.md
4. Deixar a IA corrigir

### Documentação Contínua
- Toda decisão arquitetural → `CLAUDE.md`
- Todo erro da IA → tabela "Erros Conhecidos" do `CLAUDE.md`
- Toda mudança de escopo → `PLAN.md`
- Final de sessão → atualizar `NOW.md`

### Quando usar ferramentas auxiliares

| Situação | Ferramenta | Comando |
|----------|------------|---------|
| Decisão arquitectural com trade-offs | LLM Council | `convoca o conselho` |
| Setup de lib/framework | Context7 | (automático se regra activa) |
| Codebase legacy ou validar arquitectura | Graphify | `/graphify .` |
| Decisão crítica | ultrathink | (na mensagem) |

Ver `ferramentas/` para detalhes.

---

## Adaptação por Tipo de Projeto

| Tipo | Fase 0 foco | Fase 3 testes foco | Deploy típico |
|------|-------------|-------------------|---------------|
| Site estático | SEO + concorrência | Build, SEO, acessibilidade | Vercel / Netlify |
| SaaS / App | Pesquisa de mercado | Funcionalidade + integração + segurança | VPS + Kamal |
| API | Documentação de endpoints | Endpoints + auth + rate limit | VPS ou serverless |
| Bot | Fluxos de conversa | Comandos + edge cases | Cloud function |

---

## Templates disponíveis

Em `~/.claude/skills/akita-method/templates/`:

- `PLAN-TEMPLATE.md` — estrutura do PLAN.md
- `CLAUDE-MD-TEMPLATE.md` — estrutura do CLAUDE.md (com 4 princípios pré-injetados)
- `DADOS-PROJETO-TEMPLATE.md` — coleta de informações de projeto/cliente
- `TESTES-BASE.md` — exemplos de testes por tipo de projeto
- `CI-CD-TEMPLATE.md` — pipelines GitHub Actions

---

## Checklist Rápido

- [ ] Fase 0: pesquisas em `pesquisas/`, 4 ficheiros com respostas reais
- [ ] Fase 1: `.claude/settings.json` configurado, estrutura criada, git init
- [ ] Fase 2: PLAN.md + CLAUDE.md completos (200+ linhas), zero código
- [ ] Fase 3: testes escritos, todos a falhar (Red)
- [ ] Fase 4: código implementado, todos os testes a passar (Green)
- [ ] Fase 5: código otimizado e refatorado
- [ ] Fase 6: interface e conteúdo finalizados
- [ ] Fase 7: CI/CD a funcionar, projeto em produção
