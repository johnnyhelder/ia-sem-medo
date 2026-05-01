---
description: Consolida pesquisa em PLAN.md + CLAUDE.md + PROJECT.md + NOW.md (com framework de marketing digital)
argument-hint: ""
---

# /super-power:plan

Lê a pesquisa e gera os **4 ficheiros base** que toda sessão futura vai usar — aplicando os conceitos básicos de marketing digital (persona, jornada, funil, posicionamento, KPIs).

## Pré-requisitos

Antes de executar, verificar se existe:
- `pesquisas/00-deep-research.md` (gerado por `/super-power:research`)
- OU contexto suficiente já dado pelo utilizador

Se não houver pesquisa E o utilizador não tiver dado contexto:
> "Falta contexto. Roda `/super-power:research` primeiro, ou cola aqui um briefing detalhado do projeto."

## O que fazer

Gerar **4 ficheiros na raiz do projeto**, lendo os templates da skill `akita-method`:

### 1. `PLAN.md`

Base: `~/.claude/skills/akita-method/templates/PLAN-TEMPLATE.md`

Preencher com base na pesquisa. Adicionar **secção de Marketing Digital** (NOVA, obrigatória):

```markdown
## Marketing Digital — Aplicação

### Persona primária
[nome fictício, demografia, dor, desejo, canais — extraído de pesquisas/00-deep-research.md secção 2]

### Jornada do Cliente
- **Awareness:** [como descobre o problema]
- **Consideration:** [como avalia opções]
- **Decision:** [o que faz comprar]
- **Retention:** [como volta a comprar / recomenda]

### Posicionamento (1 frase)
> Para [público específico] que [dor], [produto] é [categoria] que [diferencial real, não slogan].

### Proposta de Valor (em 1 frase)
[Verbo no infinitivo + benefício específico mensurável + sem [objeção principal]]

### Funil
- **TOFU (descoberta):** [tipo de conteúdo + canais primários]
- **MOFU (consideração):** [iscas de conversão / lead magnets]
- **BOFU (decisão):** [oferta principal + objeções a derrubar]

### KPIs primários (3 max — ligados ao "Sucesso em 90 dias")
1. [métrica + meta]
2. [métrica + meta]
3. [métrica + meta]

### Primeiras 3 páginas a criar (sequência)
1. **Homepage** — proposta de valor visível em 5 segundos + 1 CTA único
2. **Página "[diferencial]"** — autoridade, prova social
3. **Página "[oferta principal]"** — conversão, FAQ, garantias
```

Resto do PLAN.md (manter do template):
- Visão geral (1-2 frases)
- Funcionalidades MVP / Desejáveis / Futuras
- Decisões arquiteturais (com justificativa baseada na pesquisa)
- Fora de escopo (CRÍTICO — listar explicitamente)
- Cronograma estimado por fase

### 2. `CLAUDE.md`

Base: `~/.claude/skills/akita-method/templates/CLAUDE-MD-TEMPLATE.md`

**A Parte A (Princípios Universais Karpathy) é copiada literalmente. NUNCA editar.**

Para a Parte B (específico do projeto), preencher:
- Sobre o projeto
- Stack técnico (versões exatas — vir da pesquisa secção 7)
- Estrutura de pastas
- Variáveis de ambiente (sem valores reais)
- Linguagem e copy (idioma + proibições do projeto + tom da marca)
- Regras de código (obrigatórias e proibidas)
- **Regras de domínio/negócio (CRÍTICO):** vocabulário do nicho, termos a usar/evitar, regras específicas do cliente
- **Persona resumida** (1 parágrafo): quem é o cliente final
- **Posicionamento e tom de voz:** copiar do PLAN.md
- MCP e ferramentas (Context7, LLM Council, Graphify, Firecrawl se aplicável)
- Estado das fases (Fase 0 ✓, Fase 1 ⏳)
- Tabela "Erros Conhecidos da IA" vazia

### 3. `PROJECT.md`

Documento de planeamento com:
- Visão (problema + solução em 2 parágrafos)
- Equipa e papéis (se aplicável)
- Decisões arquiteturais com alternativas consideradas + justificativa
- Roadmap por fases (com datas estimadas)
- Cronograma
- **Plano de marketing inicial** (canal primário + 3 conteúdos para o lançamento)

### 4. `NOW.md`

Ficheiro novo:

```markdown
# NOW — Handoff de Sessão

> Atualizar SEMPRE no final de cada sessão.
> Lifeboat entre sessões.

## Última sessão: YYYY-MM-DD

### O que foi feito
- Pesquisa Fase 0 concluída (pesquisas/00-deep-research.md)
- PLAN.md + CLAUDE.md + PROJECT.md + NOW.md gerados

### Próximo passo imediato
- Rodar `/super-power:start` para iniciar Fase 1 (setup seguro do Claude Code)

### Bloqueios
- nenhum

### Decisões pendentes
- [se houver alguma decisão deixada em aberto durante o plan]

### Contexto importante
- Persona: [resumo de 1 frase]
- Diferencial: [resumo de 1 frase]
- Canal primário: [resumo de 1 frase]
```

## Após gerar os 4 ficheiros

Mostrar ao utilizador:

```
✓ 4 ficheiros base gerados:
  PLAN.md      — planta do projeto + framework de marketing digital
  CLAUDE.md    — cérebro do agente (carregado automaticamente)
  PROJECT.md   — visão e roadmap
  NOW.md       — handoff entre sessões

✓ Marketing digital aplicado:
  • Persona: [nome] — [resumo 1 linha]
  • Posicionamento: [1 linha]
  • Funil TOFU/MOFU/BOFU definido
  • KPIs primários: [3 métricas]
  • Sequência das primeiras 3 páginas

Estado do projeto: Fase 0 ✓

Próximo passo:
  /super-power:start

Isso inicia a Fase 1 (setup seguro do Claude Code) e abre o fluxo das 7 fases.
```

## Regras

- Se uma decisão for ambígua, PERGUNTAR ao utilizador. Não inventar.
- Para a stack, basear na pesquisa secção 7 (`pesquisas/00-deep-research.md`).
- A Parte A do CLAUDE.md (4 princípios Karpathy) NUNCA é editada. Copia literal.
- O `NOW.md` deve ter "Próximo passo: rodar `/super-power:start`".
- **Marketing digital é obrigatório.** Mesmo para projetos B2B "técnicos", aplicar persona+funil+KPIs. Estes conceitos funcionam em qualquer negócio.
- **Posicionamento em 1 frase.** Se demorar 3 frases para explicar, está mal feito — voltar a tentar.

## Referência

- Templates: `~/.claude/skills/akita-method/templates/`
- Princípios universais: `~/.claude/skills/akita-method/principios/4-principios-karpathy.md`
- Pesquisa Fase 0: `pesquisas/00-deep-research.md`
