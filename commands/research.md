---
description: Fase 0 — briefing conversacional + 7 perguntas + pesquisa deep automática
argument-hint: ""
---

# /super-power:research

Conduz a **Fase 0** de forma conversacional. Sem menus, sem copy-paste de prompts, sem ir buscar resultados a outras ferramentas. **Tudo dentro do Claude Code.**

O fluxo é em **3 etapas simples**: briefing → 7 perguntas → pesquisa automática.

---

## Etapa 1 — Briefing livre

Pergunte ao utilizador (numa só mensagem):

```
Antes de começar, conta-me sobre o teu projeto em texto corrido. Sem 
formato. Inclui o que importa para ti:

  • O que vais criar
  • Para quem (quem é o cliente)
  • Quem está envolvido (tu, equipa, parceiros)
  • Que problema resolve
  • Qualquer contexto que aches relevante

Pode ser 1 parágrafo ou 5. Não te preocupes com estrutura.
```

Aguardar a resposta. NÃO avançar até ter texto substancial. Se a resposta for muito curta (<50 palavras), pedir gentilmente mais detalhe.

---

## Etapa 2 — As 7 perguntas

Após o briefing, fazer **as 7 perguntas numa só mensagem** (ler tudo num turno é mais eficiente para o utilizador):

```
Boa. Agora 7 perguntas para fazer uma pesquisa que valha mesmo a pena. 
Responde tudo numa só mensagem (não precisas separar por número se for 
mais natural responder em texto):

1. PÚBLICO ESPECÍFICO — quem é a pessoa que vai pagar? 
   (idade, profissão, localização, hábitos, condição financeira)

2. DOR PRINCIPAL — qual é a frustração #1 desta pessoa hoje?
   (descrita nas palavras dela, não nas tuas)

3. COMO RESOLVE HOJE — sem o teu produto, o que esta pessoa faz?
   (concorrentes diretos + alternativas indiretas)

4. TEU DIFERENCIAL — por que tu e não outro? 
   (não slogan, não "qualidade" — o que é REAL e específico?)

5. CANAIS — onde esta pessoa está online?
   (Instagram, Google, LinkedIn, TikTok, fóruns, grupos…)

6. MODELO DE RECEITA — como vais ganhar dinheiro?
   (assinatura, venda única, freemium, consultoria, anúncios…)

7. SUCESSO EM 90 DIAS — qual o número que define vitória?
   (R$ X de receita? N clientes? N inscritos? autoridade no nicho?)
```

Se o utilizador responder de forma muito vaga em alguma pergunta crítica (ex: "público": "todos"), pedir esclarecimento pontual ANTES de avançar.

---

## Etapa 3 — Confirmação curta

Após as 7 perguntas, confirmar:

```
Tenho contexto suficiente para fazer a pesquisa. 
Mais alguma coisa importante que eu deva saber antes de pesquisar?
```

Se utilizador disser "não" ou "podes prosseguir": avançar para Etapa 4.
Se utilizador disser "sim, mais X": absorver e voltar a perguntar até estar pronto.

---

## Etapa 4 — Escolher como pesquisar

Apresentar **2 opções** (sem viés — deixar o utilizador decidir):

```
Tenho duas formas de fazer a pesquisa. Qual preferes?

🔵 OPÇÃO A — Aqui dentro do Claude Code (recomendado para a maioria)
   • Eu faço 8-12 buscas web cobrindo mercado, concorrência, SEO, 
     tendências e perfil dos envolvidos.
   • Demora ~5-10 minutos.
   • Resultado em 1 ficheiro: pesquisas/00-deep-research.md
   • Sem precisares de outra ferramenta.

🟢 OPÇÃO B — Externamente em Gemini Deep Research (mais profundo)
   • Pesquisa fica mais densa (relatórios de 30+ páginas).
   • Eu gero 1 prompt mestre customizado.
   • Tu colas em gemini.google.com (Deep Research é gratuito).
   • Esperas 10-30 minutos pelo relatório.
   • Trazes de volta: ou copias o conteúdo, ou colas o link público.
   • Eu importo e uso.

Responde A ou B.
```

---

## Caminho A — Pesquisa interna (default)

Use o tool **WebSearch** (built-in do Claude Code) para fazer ~10 queries em paralelo, baseadas no briefing + 7 perguntas. Exemplos de queries (substituir placeholders):

1. `tamanho mercado [nicho] [região] 2026`
2. `tendências [nicho] 2026 [região]`
3. `[público] dores frustrações Reddit Quora`
4. `[público] o que busca Google [nicho]`
5. `[concorrente 1] análise produto reviews`
6. `[concorrente 2] pricing modelo negócio`
7. `[envolvido principal] linkedin perfil autoridade [nicho]`
8. `best practices marketing [nicho] 2026`
9. `keywords SEO [nicho] [região] volume busca`
10. `ferramentas tecnologia [tipo de produto] 2026`

Se Firecrawl estiver disponível, usar para enriquecer páginas de concorrentes (scrape de homepage, pricing, copy).

Compilar tudo num único ficheiro: **`pesquisas/00-deep-research.md`** com esta estrutura:

```markdown
# Pesquisa Profunda — [Nome do Projeto]

> Gerada em [DATA] via /super-power:research
> Briefing inicial: [resumir em 2 frases]

---

## 1. Mercado

### 1.1 Tamanho e crescimento
[dados com fontes]

### 1.2 Tendências 2026
[3-5 tendências com fontes]

### 1.3 Faixas de preço praticadas
| Modelo | Preço típico | Exemplos |
|---|---|---|
| ... | ... | ... |

---

## 2. Persona — quem é o cliente

### 2.1 Demografia
[idade, género, localização, renda, profissão]

### 2.2 Dores específicas (com citações reais quando possível)
[lista numerada]

### 2.3 Desejos e aspirações
[o que esta pessoa quer ter/ser/sentir]

### 2.4 Jornada típica do cliente
- Awareness: como descobre que tem o problema
- Consideration: como avalia opções
- Decision: o que faz a pessoa decidir comprar

---

## 3. Concorrência

### 3.1 Top 5 concorrentes diretos
| Concorrente | Site | Posicionamento | Pricing | Forças | Fraquezas |
|---|---|---|---|---|---|
| ... | ... | ... | ... | ... | ... |

### 3.2 Concorrentes indiretos
[alternativas que o cliente usa hoje]

### 3.3 Gaps de mercado (oportunidades)
[3-5 lacunas que vimos durante a pesquisa]

---

## 4. SEO e canais

### 4.1 Top keywords (volume estimado + concorrência)
| Termo | Volume mensal | Concorrência | Intenção |
|---|---|---|---|
| ... | ... | ... | ... |

### 4.2 Canais onde o público está
[ranking por relevância para este público específico]

### 4.3 Tipo de conteúdo que funciona
[exemplos reais de posts/vídeos com tração]

---

## 5. Os envolvidos (perfil público)

[Para cada pessoa mencionada no briefing — APENAS info pública: linkedin, posts, autoridade no nicho. Sem inferências sobre vida privada.]

---

## 6. Aplicação de Marketing Digital

### 6.1 Posicionamento sugerido
[1 frase: "para [público] que [dor], [produto] é [categoria] que [diferencial]"]

### 6.2 Funil sugerido (TOFU / MOFU / BOFU)
- TOFU (descoberta): [conteúdo + canais]
- MOFU (consideração): [conteúdo + ferramentas]
- BOFU (decisão): [conteúdo + ofertas]

### 6.3 Proposta de valor (em 1 frase, padrão)
[Verbo no infinitivo + benefício específico + sem o quê (objeção)]

### 6.4 KPIs primários (3 max)
[ligados ao "Sucesso em 90 dias" da pergunta 7]

### 6.5 Primeiras 3 páginas a criar (sequência sugerida)
1. Homepage com proposta de valor + CTA único
2. Página "[diferencial principal]" (autoridade)
3. Página "[oferta principal]" (conversão)

---

## 7. Stack técnica recomendada

[baseada nos requisitos + custo + facilidade de manutenção com agentes IA]

---

## Fontes consultadas
[lista numerada de URLs reais com data de acesso]
```

Após gerar, mostrar:

```
✓ Pesquisa completa em pesquisas/00-deep-research.md (~[N] páginas)

Próximo passo:
  /super-power:plan

Isso vai ler a pesquisa e gerar PLAN.md + CLAUDE.md + PROJECT.md + NOW.md.
```

---

## Caminho B — Externo via Gemini Deep Research

Gerar UM prompt mestre customizado e salvar em **`pesquisas/00-prompt-deep-research.md`**:

```markdown
# Prompt para Gemini Deep Research

> Cola este prompt em gemini.google.com → activa "Deep Research".
> Espera o relatório (10-30 min). Depois traz de volta.

---

[Prompt detalhado de ~500 palavras com TODAS as 7 secções
de pesquisa que o Caminho A faria, mas formatadas como
instrução para o Gemini Deep Research. Customizado com 
os dados do briefing + 7 perguntas.]
```

Depois mostrar:

```
✓ Prompt gerado em pesquisas/00-prompt-deep-research.md

Próximos passos:
  1. Abre gemini.google.com (faz login com Google)
  2. Activa "Deep Research" no menu
  3. Cola o prompt do ficheiro acima
  4. Aguarda o relatório (10-30 min)
  5. Quando estiver pronto, volta aqui e diz uma destas opções:
     
     a) "Cola o conteúdo aqui" — eu importo directamente
     b) "Aqui está o link público: [URL]" — eu vou buscar online
        (Para o link, posso usar WebFetch built-in. Se falhar 
         por ser SPA pesado, instalas o Firecrawl. Vou-te guiar.)
```

### Quando o utilizador voltar com link

Tentar `WebFetch(url)` primeiro. Se funcionar, importar e processar.

Se `WebFetch` falhar (SPA pesado, JS-rendered):
- Verificar se Firecrawl MCP está disponível: `gh mcp list` ou `claude mcp list`
- Se não estiver, instruir instalação rápida (ver `ferramentas/firecrawl-instalacao.md`)
- Após instalado, usar Firecrawl scrape

### Quando o utilizador colar o conteúdo

Receber o markdown/texto. Salvar em `pesquisas/00-deep-research.md`. Aplicar a estrutura padrão (Caminho A) reorganizando se necessário.

---

## Regras

- **Não inventar dados.** Se a pesquisa não cobriu algo, dizer "[dados não encontrados]" em vez de adivinhar.
- **Citar fontes.** Cada estatística ou afirmação forte deve ter URL.
- **Privacidade.** Para pesquisar pessoas (envolvidos), usar APENAS info pública (linkedin, posts, entrevistas). Sem inferir sobre vida privada.
- **Marketing digital aplicado.** A secção 6 do ficheiro final é OBRIGATÓRIA — é o que diferencia este método de "só pesquisar".
- **Confirmar antes de pesquisar.** Não começar a fazer 10 buscas web sem o utilizador ter dado OK na Etapa 3.

---

## Tempo total estimado

- **Caminho A:** 8-15 minutos (briefing + 7 perguntas + 5-10min de pesquisa)
- **Caminho B:** 25-45 minutos (briefing + 7 perguntas + 20-40min Gemini + import)

A Caminho A é suficiente para 80% dos projetos. Caminho B só faz sentido para projetos onde a profundidade de research justifica o tempo extra (mercados muito competitivos, B2B com decisões caras, etc.).
