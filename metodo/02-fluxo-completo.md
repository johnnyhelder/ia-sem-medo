# 02 — Fluxo Completo: Do Zero à Produção

> O dev monta o esqueleto. A IA coloca os órgãos.

## Visão geral

```
PLAN.md → CLAUDE.md → Testes → Código → Refactor → Interface → Deploy
```

Nenhuma linha de código é gerada antes do planejamento estar completo.

## As 7+1 Fases

### Fase 0 — Coleta e Inteligência (pré-projeto)
A fase mais subestimada e mais importante. Pesquisar o mercado, o público, as palavras-chave, a concorrência e as ferramentas ANTES de qualquer decisão técnica. Guia completo com exemplos de prompts: [`metodo/00-fase-pesquisa.md`](00-fase-pesquisa.md). Template de coleta: `DADOS-PROJETO-TEMPLATE.md`.

### Fase 1 — Setup Seguro do Claude Code
Configurar o ambiente onde o agente vai trabalhar. O foco aqui é dar ao agente exactamente o que ele precisa, nem mais, nem menos:

- Configurar `.claude/settings.json` com permissões granulares — `allow` para comandos seguros (lint, testes, git status), `ask` para destrutivos (`rm`, `git push --force`)
- Criar `.claude/CLAUDE.md` com regras claras do projeto (o agente lê isso automaticamente)
- Usar `~/.claude/skills/` para skills reutilizáveis entre projetos
- Para projetos que lidam com dados sensíveis ou produção, considerar Docker como camada extra de isolamento

### Fase 2 — Fundação (ZERO código)
Criar PLAN.md (planta) e CLAUDE.md (cérebro do agente, 200+ linhas). Estrutura de diretórios. Docker Compose se aplicável. NENHUMA linha de código de negócio.

O CLAUDE.md deve conter: visão da arquitetura, stack com versões, variáveis de ambiente, estrutura de diretórios, regras de código, regras de domínio, seção de erros da IA.

### Fase 3 — Testes (TDD Puro)
Escrever TODOS os testes antes de implementar. O primeiro prompt é "escreva os testes". Se a IA sugerir código sem teste, RECUSAR.

### Fase 4 — Implementação
Agora sim, código. Guiado pelos testes. Feature por feature. Após cada uma, rodar testes. Feature nova? Primeiro teste, depois código.

### Fase 5 — Otimização
Performance, refatoração, quebrar arquivos grandes. Testes rodam após cada mudança.

### Fase 6 — Interface
Polir a camada de apresentação. Frontend, CLI, bot, API docs — o que for.

### Fase 7 — Deploy com CI/CD
Pipeline automatizada: lint → testes → build → deploy. Nunca mais deploy sem validação.

## Conceitos transversais

**Prompt Refinement**: prompts são código. Cada ajuste é um commit.

**Permissões**: Nunca aceitar tudo cegamente. Configurar `.claude/settings.json` para pedir confirmação em comandos destrutivos. Para projetos de alto risco (produção, dados sensíveis), adicionar Docker como camada extra.

**Desapego**: Se a IA erra, explicar o erro. NUNCA corrigir à mão. Documentar no CLAUDE.md.
