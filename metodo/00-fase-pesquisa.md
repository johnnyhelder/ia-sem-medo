# 00 — Fase de Pesquisa: Inteligência Antes do Código

> Esta é a Fase 0 — acontece ANTES de tudo. É o que separa um projeto bem fundamentado de um chute no escuro.
> Use IA para criar prompts de pesquisa profunda. Não pesquise à mão o que a IA faz em minutos.

---

## Por que pesquisar antes?

Se você começa um projeto sem pesquisa, está adivinhando. A IA pode gerar código perfeito para o problema ERRADO. A pesquisa garante que você sabe:

- **Quem** é o público (e o que ele busca)
- **O que** o mercado oferece (e onde estão as lacunas)
- **Como** as pessoas procuram soluções (palavras, frases, dores)
- **Quais** ferramentas usar (e por que essas e não outras)

---

## Os 4 tipos de pesquisa

### 1. Pesquisa de Mercado
Entender o cenário onde o projeto vai existir.

**O que descobrir:**
- Quem são os concorrentes diretos e indiretos
- Que serviços/produtos eles oferecem
- Faixas de preço praticadas
- Tendências emergentes no nicho
- Oportunidades de diferenciação

**Exemplo de prompt para pesquisa profunda (Gemini/ChatGPT/Perplexity):**

```
Faça uma pesquisa profunda sobre o mercado de [SEU NICHO] em [SUA REGIÃO].
Quero saber:
1. Como funciona a prestação de serviços nesse nicho
2. Quais serviços dão mais retorno financeiro
3. Quais são tendências emergentes para 2025-2026
4. Quem são os principais concorrentes (online e offline)
5. Qual o perfil do público que busca esses serviços
6. Faixas de preço praticadas na região
7. Oportunidades de diferenciação pouco exploradas
8. Quais canais digitais são mais usados (redes sociais, Google, marketplaces)

Seja exaustivo. Prefiro um relatório longo e completo do que um resumo superficial.
```

---

### 2. Pesquisa de Palavras-Chave e Dores do Público
Entender o que as pessoas REALMENTE buscam nos motores de busca.

**O que descobrir:**
- Frases mais buscadas no Google para o nicho
- Perguntas frequentes (People Also Ask)
- Dores e problemas mais pesquisados
- Volume estimado de buscas por termo
- Termos com alta busca e baixa concorrência (oportunidades)
- Variações regionais (PT-PT vs PT-BR, por exemplo)

**Exemplo de prompt:**

```
Faça uma pesquisa profunda sobre o que o público de [SEU NICHO] busca
nos motores de busca em [SEU PAÍS/REGIÃO].

Quero saber:
1. As 20 frases mais buscadas relacionadas a [SEU NICHO]
2. As perguntas mais frequentes (People Also Ask do Google)
3. Dores e problemas mais pesquisados (ex: "dor nas costas o que fazer")
4. Volume estimado de buscas mensais por termo
5. Termos com alto volume e baixa concorrência (oportunidades de conteúdo)
6. Variações regionais de termos (se aplicável)
7. Tendências sazonais (termos que sobem em certas épocas do ano)

Organize os resultados em tabela com: termo, volume estimado, concorrência,
e uma sugestão de título de artigo/conteúdo para cada termo.
```

---

### 3. Pesquisa de Concorrência Digital
Analisar o que os concorrentes estão fazendo online.

**O que descobrir:**
- Quais concorrentes aparecem no Google para os termos-chave
- Como são os sites deles (estrutura, conteúdo, funcionalidades)
- Que conteúdo produzem (blog, vídeos, redes sociais)
- Onde estão fracos (oportunidades para você ser melhor)

**Exemplo de prompt:**

```
Analise a presença digital dos principais concorrentes de [SEU NICHO]
em [SUA REGIÃO].

Para os top 5 resultados do Google ao pesquisar "[TERMO PRINCIPAL]":
1. Qual é o site? Tem blog? Quantos artigos?
2. Que serviços/produtos destacam na homepage?
3. Têm sistema de agendamento online?
4. Que redes sociais usam e com que frequência publicam?
5. Qual é a proposta de valor principal de cada um?
6. Onde estão fracos? O que falta nos sites deles?

Identifique as 3 maiores oportunidades de diferenciação.
```

---

### 4. Pesquisa de Ferramentas e Stack
Decidir que tecnologias usar (e por quê).

**O que descobrir:**
- Que frameworks/plataformas se encaixam no projeto
- Prós e contras de cada opção
- Custo (grátis vs pago)
- Curva de aprendizado
- Compatibilidade com IA (Claude Code, Cursor, etc.)

**Exemplo de prompt:**

```
Preciso escolher as ferramentas para criar [DESCRIÇÃO DO PROJETO].

Requisitos:
- [Liste os requisitos: blog, agenda, formulário, e-commerce, etc.]
- Deploy simples e barato
- SEO otimizado
- Compatível com desenvolvimento usando agentes de IA (Claude Code)

Compare as seguintes opções para cada camada:
- Framework: [Opção A] vs [Opção B] vs [Opção C]
- Banco de dados: [Opção A] vs [Opção B]
- Deploy: [Opção A] vs [Opção B]
- Estilos: [Opção A] vs [Opção B]

Para cada comparação, dê: prós, contras, custo, e recomendação final
com justificativa.
```

---

## Como usar IA para criar prompts de pesquisa

Você não precisa criar prompts perfeitos sozinho. Use a própria IA para te ajudar:

**Prompt para gerar prompts de pesquisa:**

```
Estou começando um projeto de [DESCRIÇÃO BREVE]. Antes de escrever
qualquer código, preciso fazer pesquisas profundas sobre o mercado,
o público e as ferramentas.

Crie para mim 3-5 prompts de pesquisa profunda que eu possa usar no
Gemini Deep Research (ou ChatGPT/Perplexity) para obter o máximo de
informação possível sobre:

1. O mercado de [NICHO] em [REGIÃO]
2. O que o público desse nicho busca no Google
3. A concorrência digital nesse espaço
4. As melhores ferramentas/tecnologias para o projeto

Cada prompt deve ser detalhado, com perguntas específicas numeradas,
e pedir resultados em formato organizado (tabelas quando possível).
```

---

## Onde guardar os resultados

Crie uma pasta `pesquisas/` no seu projeto e salve cada pesquisa como um ficheiro markdown:

```
seu-projeto/
├── pesquisas/
│   ├── pesquisa-mercado.md
│   ├── pesquisa-seo-keywords.md
│   ├── pesquisa-concorrencia.md
│   └── pesquisa-ferramentas.md
├── PLAN.md          ← alimentado pelas pesquisas
├── CLAUDE.md        ← alimentado pelas pesquisas
└── ...
```

As pesquisas alimentam o PLAN.md (decisões) e o CLAUDE.md (contexto para a IA).

---

## Ferramentas recomendadas para pesquisa

| Ferramenta | Melhor para | Custo |
|------------|------------|-------|
| **Gemini Deep Research** | Pesquisas longas e exaustivas, relatórios completos | Grátis (com conta Google) |
| **Perplexity** | Pesquisas rápidas com fontes citadas | Grátis / Pro |
| **ChatGPT (com busca web)** | Pesquisas conversacionais, refinamento iterativo | Grátis / Plus |
| **Claude** | Análise de documentos longos, organização de dados | Grátis / Pro |
| **Google Trends** | Tendências sazonais, comparação de termos | Grátis |
| **Ubersuggest / SEMrush** | Volume de buscas, dificuldade de keywords | Freemium |
| **Google Search Console** | Dados reais de busca do seu site (depois de publicado) | Grátis |

---

## Exemplo real: como fizemos na prática

No projeto que originou este repositório, a pesquisa envolveu:

1. **Transcrição de vídeo** — Transcrevemos um vídeo de 45 minutos para ter acesso ao texto integral dos conceitos
2. **Prompt de pesquisa profunda no Gemini** — Criámos um prompt estruturado com 10 fontes obrigatórias e 6 blocos temáticos. O Gemini retornou um relatório de dezenas de páginas
3. **Pesquisa complementar nas fontes originais** — Fomos direto aos blogs, vídeos e newsletters para verificar e aprofundar
4. **Organização em documentos temáticos** — Todo o material bruto foi organizado em 7 documentos de princípios

Para um projeto de cliente (site de massoterapeuta em Lisboa), fizemos:
- Pesquisa de mercado de massoterapia na região
- Pesquisa de palavras-chave mais buscadas (volume, concorrência)
- Análise das dores do público (dor nas costas, pescoço preso, pernas inchadas)
- Pesquisa de concorrência digital local
- Tudo isso ANTES de escrever uma linha de código

O resultado: 12 artigos de blog estratégicos baseados em dados reais, não em palpites.

---

## Resumo

| Pesquisa | Quando fazer | Resultado |
|----------|-------------|-----------|
| Mercado | Sempre, em qualquer projeto | Entender o cenário e oportunidades |
| Keywords/SEO | Se o projeto tem presença web | Saber o que o público busca |
| Concorrência | Se existem concorrentes no espaço | Encontrar lacunas para explorar |
| Ferramentas | Sempre, antes de decidir a stack | Escolhas justificadas e documentadas |

**Regra:** Nenhuma decisão técnica sem pesquisa. Nenhum conteúdo sem dados. Nenhum código antes de entender o problema.
