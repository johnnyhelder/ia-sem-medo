---
description: Fase 0 — coleta rica de contexto + briefing extraído + pesquisa profunda customizada
argument-hint: ""
---

# /super-power:research

Conduz a **Fase 0** com filosofia central: **informação antes de planejamento**.

O utilizador já tem muito material (PDFs, áudios, perfis sociais, currículos). Em vez de pedir para ele lembrar e escrever um briefing, **fazemos coleta rica primeiro** — depois o agente extrai contexto e só pergunta o que faltar.

---

## Fluxo em 7 etapas

### ETAPA 1 — Tipo de projeto

Pergunta única ao utilizador:

```
Antes de mais nada, qual destes descreve melhor o teu projeto?

  1. PROJETO PRÓPRIO
     Vais criar algo para TI: teu negócio, teu portfolio, infoproduto teu.

  2. CLIENTE TERCEIRIZADO
     Vais desenvolver PARA OUTRA pessoa ou empresa (és freelancer/agência).

  3. EMPRESA ONDE TRABALHO
     Projeto interno onde és sócio, fundador, CTO ou responsável.

Responde: 1, 2 ou 3.
```

Guarda a resposta em variável `PROJECT_TYPE`. Vai influenciar Etapa 6.

### ETAPA 2 — Coleta rica de contexto

Criar pasta `docs/` no projeto e gerar `docs/README.md` com checklist:

```bash
mkdir -p docs
```

Escrever `docs/README.md`:

```markdown
# Material para a pesquisa profunda

> Coloca aqui tudo o que tens sobre o projeto, o cliente ou ti mesmo.
> Quanto mais material → melhor a pesquisa → melhor o plano.

## Documentos (PDFs / Word / Imagens)
- [ ] Currículo profissional
- [ ] Currículo Lattes (BR — académico)
- [ ] Brand guidelines (cores, fontes, tom de voz)
- [ ] Propostas comerciais anteriores
- [ ] Brochuras / materiais de marketing
- [ ] Apresentações de pitch
- [ ] Relatórios financeiros (se aplicável)
- [ ] Análises de mercado já feitas
- [ ] Casos de sucesso anteriores
- [ ] Depoimentos de clientes (texto ou imagem)

## Áudios / vídeos
- [ ] Entrevistas em podcasts (MP3)
- [ ] Gravações de calls com clientes
- [ ] Vídeos de apresentação
- [ ] Talks que deste em eventos

## Fotos / imagens
- [ ] Logo (em vetor se possível)
- [ ] Mood board
- [ ] Fotos do produto / serviço
- [ ] Fotos da equipa
- [ ] Print de Instagram analytics

## Outros
- [ ] Lista de clientes actuais
- [ ] Histórico de projetos
- [ ] Contratos modelo
- [ ] Métricas existentes (Google Analytics, etc.)

---

Quando tiveres tudo aqui, volta ao Claude Code e diz: **"tenho tudo aí"** ou **"pronto"**.
```

Depois pedir ao utilizador (na conversa):

```
Criei a pasta docs/ com uma checklist. Faz isto agora:

1. ABRE A PASTA docs/ NO TEU FINDER (Mac) ou EXPLORADOR (Windows/Linux).
   Caminho: $(pwd)/docs

2. ARRASTA TUDO O QUE TENS SOBRE O PROJETO PARA LÁ:
   - PDFs, Word, imagens, áudios, vídeos
   - Currículos (teu, dos sócios, dos envolvidos)
   - Brand guidelines
   - Apresentações
   - Tudo o que achares que pode informar o agente

3. RESPONDE-ME COM A LISTA DE LINKS RELEVANTES (1 por linha):
   - Site da empresa (se houver)
   - Site pessoal / portfolio
   - LinkedIn (teu + sócios + responsável pelo projeto)
   - Instagram (pessoal + empresa)
   - Facebook (pessoal + página)
   - Twitter/X
   - GitHub
   - YouTube
   - TikTok
   - Currículo Lattes (BR)
   - Newsletter ou blog
   - Outros perfis públicos relevantes

⚠️  ESTA ETAPA VAI DEMORAR.
Não te apresses. Reúne o máximo possível.
A qualidade da pesquisa depende deste material.
Quando tiveres tudo, diz "tenho tudo aí" ou "pronto".

Tempo típico: 10-30 minutos.
```

### ETAPA 3 — Análise dos materiais

**Aguardar** o utilizador dizer "pronto" / "tenho tudo aí" / similar antes de avançar.

Depois:

```bash
echo "Conteúdo de docs/:"
ls -la docs/
```

Para cada ficheiro em `docs/`:
- **PDFs**: usar Read tool (Claude Code lê PDFs nativamente)
- **Imagens**: usar Read tool (vision)
- **Áudios/vídeos**: avisar utilizador "preciso da transcrição — podes usar Whisper ou OpenAI transcription, e colocar o `.txt` em docs/"
- **Texto / Markdown**: Read tool

Para os links que o utilizador deu:
- Tentar `WebFetch` primeiro
- Se for SPA pesado (Instagram, etc.): se Firecrawl disponível, usar `firecrawl_scrape`
- Se nada funcionar: pedir ao utilizador um screenshot ou copy-paste do conteúdo

Extrair de cada fonte:
- **Posicionamento percebido** (como a pessoa/empresa se descreve)
- **Tom de voz** (formal, casual, técnico, emotivo)
- **Audiência aparente** (a quem se dirige)
- **Frequência e estilo** de posts/conteúdo
- **Diferenciadores mencionados**
- **Histórico relevante** (formação, trajetória, marcos)

### ETAPA 4 — Briefing extraído (NÃO peças ao utilizador para escrever briefing)

Apresentar o que o agente extraiu:

```
Com base no material que colocaste em docs/ e nos links que partilhaste,
percebi o seguinte:

📋 SOBRE [TI / O CLIENTE / A EMPRESA]:
   • Nome / marca: ...
   • Trajetória: ...
   • Posicionamento actual: ...
   • Tom de voz: ...
   • Diferencial percebido: ...

🎯 SOBRE O PROJETO:
   • O que parece ser: ...
   • Para quem aparenta ser dirigido: ...
   • Que problema parece resolver: ...

🌐 PRESENÇA DIGITAL DETECTADA:
   • Canais activos: ...
   • Engagement aparente: ...
   • Pontos fortes: ...
   • Pontos fracos / oportunidades: ...

❓ O QUE NÃO CONSEGUI DETECTAR (preciso da tua ajuda):
   • [pergunta 1]
   • [pergunta 2]
   • ...

Confirmas o que entendi? Corriges algo? Adicionas o que falta?
```

### ETAPA 5 — Perguntas pontuais (só gaps)

Com base na resposta da Etapa 4, identificar quais das 7 perguntas clássicas ainda não foram respondidas pelos materiais:

1. Público específico (provavelmente não detectado nos materiais)
2. Dor #1 nas palavras do cliente (raramente nos materiais)
3. Como resolvem hoje (concorrentes — pode estar parcialmente em materiais)
4. Diferencial real (no materiais provavelmente está como slogan — pedir o real)
5. Canais (já detectado nos materiais provavelmente)
6. Modelo de receita (pode não estar claro)
7. Sucesso em 90 dias (raramente nos materiais)

Perguntar **apenas as que faltam**, não as 7 todas:

```
Para fechar o briefing, faltam-me [X] respostas:

[lista das que ainda faltam, customizada]

Responde tudo numa só mensagem.
```

### ETAPA 6 — Pesquisa profunda customizada por tipo

Baseada no `PROJECT_TYPE` da Etapa 1.

#### Se PROJETO PRÓPRIO (1):

Pesquisa foca em:
- **Sobre o dev (utilizador):**
  - Autoridade actual no nicho (LinkedIn, posts, citações)
  - Audiência existente (seguidores, newsletter, eventos)
  - Histórico relevante (formação, projetos anteriores)
  - Visibilidade ("dev nome" no Google)
- **Sobre o mercado-alvo:**
  - Tamanho, tendências
  - Comportamento de compra
  - Onde o público está
- **Concorrência:**
  - Top 5 directos
  - Indirectos relevantes
  - Gaps de mercado
- **SEO + canais:**
  - Keywords
  - Tipo de conteúdo que funciona
  - Plataformas dominantes

#### Se CLIENTE TERCEIRIZADO (2):

Pesquisa foca em:
- **Sobre a empresa cliente:**
  - História, fundação, marcos
  - Notícias recentes (últimos 12 meses)
  - Eventos, prémios, polémicas
  - Posicionamento actual
  - Concorrentes percebidos
- **Sobre os sócios / fundadores:**
  - Trajetória (LinkedIn deep)
  - Outras empresas
  - Valores expressos publicamente
- **Sobre o RESPONSÁVEL pelo projeto** (CRÍTICO):
  - Função actual
  - Posts recentes (últimos 6 meses)
  - O que valoriza
  - Estilo de decisão
  - Receios aparentes
- **Sobre o mercado do cliente:**
  - Tendências
  - Concorrência directa
  - O que falta no mercado

#### Se EMPRESA ONDE TRABALHO (3):

Mesma estrutura que terceirizado, mas:
- Adicionar análise interna do papel do utilizador na empresa
- Pesquisar autoridade interna (papel decisório, alinhamento com a direcção)
- Identificar bloqueios típicos de projetos internos

### ETAPA 7 — Consolidar em `pesquisas/00-deep-research.md`

Estrutura:

```markdown
# Pesquisa Profunda — [Nome do Projeto]

> Tipo: [PROJETO PRÓPRIO / CLIENTE TERCEIRIZADO / EMPRESA TRABALHO]
> Gerado em [DATA]
> Baseado em: [N] documentos em docs/ + [N] links analisados

---

## 1. Contexto extraído dos materiais (Etapa 3)
[Resumo dos PDFs, áudios, perfis lidos]

## 2. Perfis sociais analisados
[Tabela: link, posicionamento, tom, engagement, observações]

## 3. Sobre [tu / o cliente / a empresa]
[Trajetória, autoridade, diferencial real]

## 4. Sobre o(s) responsável(eis) pelo projeto
[Para CLIENTE/EMPRESA: deep research do decisor]

## 5. Mercado
[Tamanho, tendências, faixas de preço]

## 6. Persona
[Demografia, dores específicas, jornada]

## 7. Concorrência
[Top 5 directos + indirectos + gaps]

## 8. SEO e canais
[Keywords + canais + tipo de conteúdo que funciona]

## 9. Aplicação de Marketing Digital
[Posicionamento + funil + KPIs + primeiras 3 páginas]

## 10. Stack técnica recomendada

## Fontes consultadas
```

Após gerar, mostrar:

```
✓ Pesquisa profunda completa em pesquisas/00-deep-research.md

Resumo:
  • [N] documentos analisados em docs/
  • [N] links explorados
  • [N] páginas de pesquisa final

Próximo passo:
  /super-power:plan

Vai consolidar TUDO (pesquisa + materiais) em PLAN.md, CLAUDE.md,
PROJECT.md e NOW.md, com framework de marketing digital aplicado.
```

---

## Regras

- **Aguardar SEMPRE** o utilizador confirmar antes de cada etapa principal (pasta criada → docs colocados → links partilhados → análise pronta → briefing OK).
- **Avisar tempo** antes de etapas longas: "esta etapa vai demorar X minutos".
- **Não inventar** dados que não estão nos materiais ou na pesquisa. Se faltar, perguntar.
- **Privacidade**: para pesquisar pessoas, usar APENAS info pública. Não inferir sobre vida privada.
- **Aplicar marketing digital sempre** (mesmo para B2B técnico): persona, jornada, funil, KPIs.

## Tempo total estimado

- Etapas 1-2 (tipo + coleta): 10-30 minutos (utilizador a juntar materiais)
- Etapa 3 (análise pelo agente): 5-15 minutos
- Etapas 4-5 (briefing + perguntas): 5-10 minutos
- Etapa 6 (pesquisa profunda): 10-20 minutos
- Etapa 7 (consolidação): 2-5 minutos

**Total: 30-90 minutos** (vs ~10 minutos do método antigo, mas com qualidade muito superior).

A maior parte do tempo é o utilizador a colocar materiais em docs/ — não é tempo do agente.
