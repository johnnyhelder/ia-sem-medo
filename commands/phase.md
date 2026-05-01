---
description: Avança para a Fase N do método (2-7) com regras específicas
argument-hint: "<número da fase: 2, 3, 4, 5, 6 ou 7>"
---

# /super-power:phase

Executa a Fase N do método. Cada fase tem entregáveis específicos e regras inegociáveis.

## Validação inicial

1. Ler número da fase do argumento. Se inválido (não 2-7) ou ausente: pedir.
2. Ler `CLAUDE.md` para verificar fases anteriores concluídas.
3. Se fase anterior incompleta: avisar mas permitir prosseguir se utilizador insistir.

## Fase 2 — Fundação (ZERO código)

Expande o `CLAUDE.md` para 200+ linhas com toda a lógica de negócio. NENHUMA linha de código.

**Ações:**
- Preencher TODAS as secções vazias do `CLAUDE.md`
- Documentar TODAS as variáveis de ambiente necessárias (sem valores reais)
- Criar `.env.example` com placeholders
- Documentar TODAS as integrações externas (APIs, serviços)
- Detalhar regras de código e regras de domínio
- Criar diagramas em ASCII se ajudar (no PLAN.md)

**Entregável:** PLAN.md + CLAUDE.md totalmente preenchidos. Ainda zero código.

## Fase 3 — Testes (TDD Puro)

Escrever TODOS os testes ANTES de implementar.

**Ações:**
- Para cada feature do PLAN.md, escrever testes
- Primeiro prompt à IA: "escreva os testes para [feature]"
- Se IA sugerir código de implementação: RECUSAR
- Categorias: build, funcionalidade, segurança, qualidade, integração
- Usar mocks para componentes que não existem ainda

**Regra:** Todos os testes devem FALHAR (Red). Se algum passa sem código, está mal escrito.

**Entregável:** Suite de testes completa, todos a falhar.

**Referência:** `~/.claude/skills/akita-method/templates/TESTES-BASE.md`

## Fase 4 — Implementação

Agora sim, código. Guiado pelos testes.

**Ações:**
- Implementar feature por feature, na ordem do PLAN.md
- Após CADA feature, rodar testes
- Se feature nova surgir: PRIMEIRO teste, DEPOIS código
- Não otimizar (isso é Fase 5)

**Prompt padrão:**
> "Temos N testes a falhar. Implementa [feature X] seguindo regras do CLAUDE.md. Roda os testes depois."

**Regra:** Todo código DEVE ter teste correspondente. Código sem teste = não existe.

**Entregável:** Tudo a funcionar, todos os testes a passar (Green).

## Fase 5 — Otimização

Melhorar sem quebrar.

**Ações:**
- Identificar gargalos (Lighthouse para sites, profiling para APIs)
- Refatorar código que funciona mas está feio
- Quebrar ficheiros grandes em módulos
- Rodar testes após CADA mudança
- Atualizar CLAUDE.md com decisões de refatoração
- Considerar `/graphify .` para visualizar arquitectura e identificar god-nodes

**Entregável:** Código limpo e otimizado, testes continuam a passar.

## Fase 6 — Interface

Polir a camada de apresentação.

**Ações:**
- Implementar/polir interface (frontend, CLI, bot, API docs)
- Criar/polir conteúdo (textos, copywriting)
- Testar fluxo completo de ponta a ponta
- Ajustes de design, responsive, acessibilidade

**Entregável:** Interface finalizada, conteúdo pronto.

## Fase 7 — Deploy

Colocar em produção com pipeline automatizada.

**Ações (em ordem):**
1. Criar pipeline CI/CD (`~/.claude/skills/akita-method/templates/CI-CD-TEMPLATE.md`)
2. Configurar: lint → testes → build → deploy
3. Configurar ambiente de produção (variáveis, secrets)
4. Configurar domínio + SSL
5. Primeiro deploy
6. Verificar que push → testa → deploya

**Entregável:** Projeto em produção, CI/CD a funcionar.

## Após executar a fase

Sempre:
1. Atualizar `CLAUDE.md` marcando a fase como concluída
2. Atualizar `NOW.md` com o que foi feito + próximo passo
3. Sugerir commit: `feat(fase-N): descrição curta`

## Regras transversais

- **Desapego do código**: se a IA gera errado, NUNCA corrigir à mão. Documentar em "Erros Conhecidos da IA" no CLAUDE.md, e re-promptar.
- **Documentação contínua**: toda decisão arquitetural vai para CLAUDE.md.
- **Prompt refinement**: cada ajuste é um commit. Iteração é normal.
- **ultrathink** em decisões arquiteturais.

## Referência

- Fluxo completo: `metodo/02-fluxo-completo.md`
- Por fase específica:
  - TDD: `metodo/03-tdd-com-ia.md`
  - Pair programming: `metodo/04-pair-programming-ia.md`
  - Estimativas: `metodo/05-gestao-estimativas.md`
