---
description: Consolida pesquisas em PLAN.md + CLAUDE.md + PROJECT.md + NOW.md
argument-hint: ""
---

# /poderoso:plan

Lê todas as pesquisas e dados do projeto e gera os **4 ficheiros base** que toda sessão futura vai usar.

## Pré-requisitos

Antes de executar, verifique se existe:
- Pasta `pesquisas/` com pelo menos 1 ficheiro com respostas reais (não apenas prompts)
- OU contexto suficiente já dado pelo utilizador

Se não houver pesquisas E o utilizador não tiver dado contexto suficiente:
> "Falta contexto. Rode `/poderoso:research` primeiro, ou cole aqui um briefing do projeto."

## O que fazer

Gere **4 ficheiros na raiz do projeto**, lendo os templates da skill `akita-method`:

### 1. `PLAN.md`

Base: `~/.claude/skills/akita-method/templates/PLAN-TEMPLATE.md`

Preencha com base nas pesquisas:
- Visão geral (1-2 frases)
- Funcionalidades MVP / Desejáveis / Futuras
- Decisões arquiteturais (com justificativa baseada na pesquisa de ferramentas)
- Fora de escopo (CRÍTICO — listar explicitamente)
- Cronograma estimado por fase

### 2. `CLAUDE.md`

Base: `~/.claude/skills/akita-method/templates/CLAUDE-MD-TEMPLATE.md`

**A Parte A (Princípios Universais Karpathy) é copiada literalmente.**

Para a Parte B (específico do projeto), preencha:
- Sobre o projeto
- Stack técnico (versões exatas)
- Estrutura de pastas
- Variáveis de ambiente
- Linguagem e copy (idioma + proibições do projeto)
- Regras de código (obrigatórias e proibidas)
- Regras de domínio/negócio
- MCP e ferramentas (Context7, LLM Council, Graphify se aplicável)
- Estado das fases (Fase 0 ✓, Fase 1 ⏳)
- Tabela "Erros Conhecidos da IA" vazia (será preenchida com o tempo)

### 3. `PROJECT.md`

Base: `~/.claude/skills/akita-method/templates/DADOS-PROJETO-TEMPLATE.md` (adaptado)

Documento de planeamento com:
- Visão (problema + solução)
- Equipa e papéis (se aplicável)
- Decisões arquiteturais com alternativas consideradas
- Roadmap por fases
- Cronograma

### 4. `NOW.md`

Ficheiro novo (não há template, criar do zero):

```markdown
# NOW — Handoff de Sessão

> Atualizar SEMPRE no final de cada sessão.
> Lifeboat entre sessões.

## Última sessão: YYYY-MM-DD

### O que foi feito
- (lista do que aconteceu nesta sessão)

### Próximo passo imediato
- (UMA coisa concreta para começar a próxima sessão)

### Bloqueios
- (nada / lista)

### Decisões pendentes
- (nada / lista)

### Contexto importante
- (qualquer coisa que vai esquecer e precisar lembrar)
```

## Após gerar os 4 ficheiros

Mostre ao utilizador:

```
✓ 4 ficheiros base gerados:
  PLAN.md      — planta do projeto
  CLAUDE.md    — cérebro do agente (carregado automaticamente)
  PROJECT.md   — visão e roadmap
  NOW.md       — handoff entre sessões

Estado do projeto: Fase 0 concluída ✓

Próximo passo:
  /poderoso:start

Isso inicia a Fase 1 (setup seguro do Claude Code) e abre o fluxo das 7 fases.
```

## Regras

- Se uma decisão for ambígua, PERGUNTE ao utilizador. Não invente.
- Para a stack, baseie-se nas pesquisas de `pesquisas/04-ferramentas.md` se existir.
- A Parte A do CLAUDE.md (4 princípios Karpathy) NUNCA é editada. Copia literal.
- O `NOW.md` deve ter "Próximo passo: rodar `/poderoso:start`".

## Referência

- Templates: `~/.claude/skills/akita-method/templates/`
- Princípios: `~/.claude/skills/akita-method/principios/4-principios-karpathy.md`
