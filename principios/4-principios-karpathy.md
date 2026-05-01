# Os 4 Princípios — Karpathy + Anthropic

> Diretrizes comportamentais para reduzir os erros mais comuns de IA em código.
> Adaptado de [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) (104k stars) e do [artefacto público da Anthropic](https://claude.ai/public/artifacts/39364733-b29a-443b-8ca2-a6e57977fbb0).

---

## A origem

Em 2026, o [Andrej Karpathy](https://x.com/karpathy/status/2015883857489522876) publicou observações sobre os erros que LLMs cometem ao programar:

> "Os modelos fazem suposições erradas em seu nome e seguem em frente sem verificar. Não gerem a confusão deles, não pedem clarificação, não trazem inconsistências à tona, não apresentam trade-offs, não discordam quando deviam."

> "Eles adoram complicar código e APIs, inflar abstrações, não limpar código morto... implementam uma construção inflada de 1000 linhas quando 100 bastariam."

A solução: 4 princípios universais que entram no `CLAUDE.md` do projeto e mudam o comportamento do agente.

---

## 1. Pensar Antes de Codar

**Não suponha. Não esconda confusão. Traga trade-offs à tona.**

LLMs costumam escolher uma interpretação em silêncio e seguir com ela. Este princípio força raciocínio explícito:

- **Declarar suposições** — Se houver dúvida, perguntar em vez de adivinhar
- **Apresentar múltiplas interpretações** — Não escolher em silêncio quando existe ambiguidade
- **Discordar quando fizer sentido** — Se existe abordagem mais simples, falar
- **Parar quando confuso** — Nomear o que não está claro e pedir clarificação

---

## 2. Simplicidade Primeiro

**Código mínimo que resolve o problema. Nada especulativo.**

Combate à tendência de over-engineering:

- Sem features além do pedido
- Sem abstrações para código de uso único
- Sem "flexibilidade" ou "configurabilidade" que não foi solicitada
- Sem tratamento de erro para cenários impossíveis
- Se 200 linhas poderiam ser 50, reescrever

**Teste de validação:** Um engenheiro sênior diria que isso está complicado demais? Se sim, simplificar.

---

## 3. Mudanças Cirúrgicas

**Tocar só no que for necessário. Limpar só a própria bagunça.**

Ao editar código existente:

- Não "melhorar" código adjacente, comentários ou formatação
- Não refatorar coisas que não estão quebradas
- Combinar com o estilo existente, mesmo discordando dele
- Se notar código morto não relacionado, mencionar — não deletar

Quando suas mudanças criam órfãos:

- Remover imports/variáveis/funções que SUAS mudanças deixaram sem uso
- Não remover código morto pré-existente sem ser pedido

**Teste:** Cada linha modificada deve traçar diretamente ao pedido do utilizador.

---

## 4. Execução Orientada por Objetivo

**Definir critérios de sucesso. Iterar até verificar.**

Transformar tarefas imperativas em objetivos verificáveis:

| Em vez de... | Transformar em... |
| --- | --- |
| "Adicionar validação" | "Escrever testes para inputs inválidos, depois fazer passar" |
| "Corrigir o bug" | "Escrever um teste que reproduz o bug, depois fazer passar" |
| "Refatorar X" | "Garantir que os testes passam antes e depois" |

Para tarefas multi-passo, declarar plano breve:

```
1. [Passo] → verificar: [check]
2. [Passo] → verificar: [check]
3. [Passo] → verificar: [check]
```

**Insight de Karpathy:**

> "LLMs são excepcionalmente bons em iterar até atingir objetivos específicos. Não diga o que fazer — dê critérios de sucesso e veja-o trabalhar."

Critérios de sucesso fortes permitem que o agente itere de forma independente. Critérios fracos ("fazer funcionar") exigem clarificação constante.

---

## Como integrar no seu projeto

Estes 4 princípios já estão pré-injetados no `CLAUDE-MD-TEMPLATE.md` deste repositório. Quando você roda `/super-power:plan`, eles entram automaticamente no `CLAUDE.md` do seu projeto.

Para projetos existentes, basta colar a Parte A do template no seu `CLAUDE.md` actual.

---

## Trade-off importante

Estes princípios privilegiam **cautela sobre velocidade**. Para tarefas triviais (fix de typo, one-liner óbvio), use bom senso — nem toda mudança precisa do rigor completo.

O objetivo é reduzir erros caros em trabalho não-trivial, não atrasar tarefas simples.

---

## Sinais de que está a funcionar

Estes princípios estão a funcionar se você ver:

- **Menos mudanças desnecessárias nos diffs** — Só aparecem as mudanças pedidas
- **Menos reescritas por overcomplicação** — O código sai simples na primeira
- **Perguntas de clarificação chegam ANTES da implementação** — Não depois dos erros
- **PRs limpos e mínimos** — Sem refatorações drive-by ou "melhorias" não pedidas

---

## Créditos

- **Andrej Karpathy** — Observações originais ([post no X](https://x.com/karpathy/status/2015883857489522876))
- **Forrest Chang** — Empacotamento como Skill / CLAUDE.md ([repositório com 104k stars](https://github.com/forrestchang/andrej-karpathy-skills))
- **Anthropic** — Template público de CLAUDE.md adaptado para projetos reais
