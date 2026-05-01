---
description: Fase 0 — pesquisa de mercado, SEO, concorrência e ferramentas antes de qualquer código
argument-hint: "[descrição breve do projeto]"
---

# /poderoso:research

Conduz a **Fase 0** do método: pesquisa estruturada antes de tomar qualquer decisão técnica.

## Quando o utilizador chama este comando

1. **Se o utilizador deu argumento** (ex: `/poderoso:research site para massoterapeuta em Lisboa`):
   - Use a descrição como contexto para todos os 4 prompts abaixo
   - Pergunte 2-3 esclarecimentos rápidos se necessário (público-alvo, região exacta, prazo)

2. **Se o utilizador NÃO deu argumento**:
   - Pergunte numa só mensagem:
     - O que vai criar (1 frase)
     - Para quem (público)
     - Onde (região/idioma)
     - Que problema resolve

## O que fazer depois

Crie a pasta `pesquisas/` no projeto actual e gere 4 ficheiros markdown, **um para cada tipo de pesquisa**, com prompts prontos para o utilizador colar no Gemini Deep Research / ChatGPT / Perplexity:

### 1. `pesquisas/01-mercado.md`

Prompt customizado ao projeto, baseado em `metodo/00-fase-pesquisa.md` secção "Pesquisa de Mercado". Substitua os placeholders pelos dados reais do utilizador.

### 2. `pesquisas/02-keywords-seo.md`

Prompt para o utilizador descobrir o que o público busca no Google. Customizado para a região e idioma certos (PT-BR vs PT-PT vs EN).

### 3. `pesquisas/03-concorrencia.md`

Prompt para análise digital dos top 5 concorrentes nos resultados do Google.

### 4. `pesquisas/04-ferramentas.md`

Prompt para escolher stack baseado em requisitos reais do projeto. Inclua "compatível com desenvolvimento por agentes de IA" como requisito.

## Após criar os 4 ficheiros

Mostre ao utilizador:

```
✓ 4 pesquisas geradas em pesquisas/

Próximos passos:
  1. Abra cada ficheiro em pesquisas/
  2. Cole o prompt no Gemini Deep Research (ou ChatGPT / Perplexity)
  3. Cole a resposta DE VOLTA no mesmo ficheiro (substituindo o prompt)
  4. Quando os 4 ficheiros tiverem respostas reais, rode:
     /poderoso:plan

Ferramentas recomendadas:
  - Gemini Deep Research (gratuito, melhor para relatórios longos)
  - Perplexity (rápido, com fontes citadas)
  - ChatGPT com busca web

Não pesquise à mão. A IA faz em minutos o que demoraria dias.
```

## Regras

- NUNCA escreva código de implementação nesta fase. Só pesquisa.
- Os prompts devem ter perguntas NUMERADAS (1., 2., 3.) e pedir resultados em **tabelas**.
- Adapte o vocabulário ao idioma do utilizador (PT-BR vs PT-PT vs EN).
- Se o utilizador não souber a região, sugira "Brasil" para PT-BR ou "Portugal" para PT-PT.

## Referência

- Guia completo: `metodo/00-fase-pesquisa.md`
- Template de coleta: `skill/akita-method/templates/DADOS-PROJETO-TEMPLATE.md`
