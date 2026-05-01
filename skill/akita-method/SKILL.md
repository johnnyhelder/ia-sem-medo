---
name: akita-method
description: "Método estruturado para criar e executar projetos Claude Code com disciplina de engenharia sénior. Combina os 4 princípios anti-erro de Karpathy/Anthropic, o Akita Way (Anti-Vibe Coding + XP), e ferramentas auxiliares (Context7, LLM Council, Graphify). Acionar SEMPRE que o utilizador quiser começar um projeto novo, reestruturar um existente, ou pedir ajuda para planear antes de programar. Triggers: 'novo projeto', 'começar do zero', 'criar um site', 'montar uma aplicação', 'CLAUDE.md', 'PLAN.md', 'TDD com IA', 'pair programming com IA', 'método Akita', '/super-power:*'."
---

# Akita Method — Skill Orquestradora

Método para criar projetos Claude Code do zero à produção com disciplina de engenharia sénior. Anti-Vibe Coding: o agente nunca lidera, executa sob controlo do humano.

> **"O dev monta o esqueleto. A IA coloca os órgãos."** — Fábio Akita

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

## Os 6 slash commands principais

A Skill orquestra os comandos. Detalhes em cada ficheiro `.md`:

| Comando | Faz |
|---------|-----|
| `/super-power:research` | Fase 0 — briefing conversacional + 7 perguntas + pesquisa deep automática |
| `/super-power:plan` | Consolida pesquisas em PLAN.md + CLAUDE.md + PROJECT.md + NOW.md |
| `/super-power:start` | Fase 1 — setup seguro (`.claude/settings.json`, estrutura) |
| `/super-power:phase N` | Avança para a Fase N (2-7) com regras específicas |
| `/super-power:status` | Lê CLAUDE.md + NOW.md e resume estado |
| `/super-power:uninstall` | Remove skill e commands (com backup recuperável) |

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
