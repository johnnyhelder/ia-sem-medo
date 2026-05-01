---
description: Fase 0 — pesquisa de mercado, SEO, concorrência e ferramentas antes de qualquer código
argument-hint: "[descrição breve do projeto, opcional]"
---

# /super-power:research

Conduz a **Fase 0** do método: pesquisa estruturada antes de tomar qualquer decisão técnica.

## Quando o utilizador chama este comando

### Caso 1 — Argumento já dado

Se o utilizador chamou com argumento (ex: `/super-power:research loja online de roupa`), use a descrição como contexto e pergunte só os 3 esclarecimentos rápidos do Caso 2 (público, idioma/região, problema).

### Caso 2 — Sem argumento

Apresentar **menu numerado** dos tipos de projeto mais comuns em Brasil/Portugal (curado a partir de pesquisa real de mercado), e pedir 1 resposta:

```
Antes de gerar as pesquisas, escolhe o tipo de projeto:

╔════════════════════════════════════════════════════════════════════╗
║  TIPOS DE PROJETO MAIS COMUNS                                       ║
╠════════════════════════════════════════════════════════════════════╣
║                                                                     ║
║  Web / Sites                                                        ║
║   1. Site institucional (apresentar negócio, captar contactos)      ║
║   2. Landing page (lançamento, venda de produto único)              ║
║   3. Portfolio profissional (designer, fotógrafo, freelancer)       ║
║   4. Blog / site de conteúdo (SEO, autoridade no nicho)             ║
║                                                                     ║
║  Comércio                                                           ║
║   5. Loja online / e-commerce (venda direta de produtos)            ║
║   6. Marketplace (vários vendedores na mesma plataforma)            ║
║                                                                     ║
║  Serviços                                                           ║
║   7. Sistema de agendamento / reservas (clínicas, salões, ...)      ║
║   8. Plataforma de cursos / infoproduto (área de membros)           ║
║   9. Newsletter / membership (conteúdo recorrente pago)             ║
║                                                                     ║
║  Aplicações                                                         ║
║  10. SaaS / sistema de gestão (CRM, ERP, ferramenta vertical)       ║
║  11. App mobile (delivery, agendamento, fidelidade)                 ║
║  12. Bot WhatsApp / Telegram (atendimento, vendas, suporte)         ║
║                                                                     ║
║  Técnico                                                            ║
║  13. API / backend para app existente                               ║
║  14. Dashboard / painel administrativo                              ║
║  15. Comunidade / fórum                                             ║
║                                                                     ║
║  Não está aqui?                                                     ║
║  16. Outro — descreve numa frase o que queres construir             ║
║                                                                     ║
╚════════════════════════════════════════════════════════════════════╝

Responde com o número (ex: "5") ou descreve livremente (ex: "16: gerador de palavras-passe seguras").
```

### Após o utilizador escolher

Se escolheu **número 1-15:** assume o tipo dessa linha como contexto inicial.
Se escolheu **16 + descrição:** usa a descrição como contexto.
Se escolheu **número inválido:** repete o menu.

Em qualquer caso, perguntar 3 esclarecimentos numa só mensagem:

```
Mais 3 perguntas rápidas:

  a) Para quem é? (ex: massoterapeutas em Lisboa, designers freelancer no Brasil, pais de adolescentes)
  b) Idioma/região? (PT-PT, PT-BR, EN, ES…)
  c) Que problema resolve? (1 frase)

Responde tudo numa só mensagem e arranco as 4 pesquisas.
```

## O que fazer depois das respostas

Crie a pasta `pesquisas/` no projeto actual e gere 4 ficheiros markdown, cada um com prompt customizado pronto para colar no Gemini Deep Research / ChatGPT / Perplexity:

### 1. `pesquisas/01-mercado.md`

Prompt customizado baseado em `metodo/00-fase-pesquisa.md` secção "Pesquisa de Mercado". Substituir placeholders pelos dados reais do utilizador (tipo de projeto, público, região, problema).

### 2. `pesquisas/02-keywords-seo.md`

Prompt para descobrir o que o público busca no Google. Ajustado para a região e idioma certos.

### 3. `pesquisas/03-concorrencia.md`

Prompt para análise digital dos top 5 concorrentes nos resultados do Google.

### 4. `pesquisas/04-ferramentas.md`

Prompt para escolher stack baseado em requisitos reais. Sempre incluir "compatível com desenvolvimento por agentes de IA (Claude Code)" como requisito.

## Após criar os 4 ficheiros

Mostrar ao utilizador:

```
✓ 4 pesquisas geradas em pesquisas/

Próximos passos:
  1. Abrir cada ficheiro em pesquisas/
  2. Colar o prompt no Gemini Deep Research (ou ChatGPT / Perplexity)
  3. Colar a resposta DE VOLTA no mesmo ficheiro (substituindo o prompt)
  4. Quando os 4 ficheiros tiverem respostas reais, rodar:
     /super-power:plan

Ferramentas recomendadas:
  - Gemini Deep Research (gratuito, melhor para relatórios longos)
  - Perplexity (rápido, com fontes citadas)
  - ChatGPT com busca web

Não pesquise à mão. A IA faz em minutos o que demoraria dias.
```

## Regras

- NUNCA escrever código de implementação nesta fase. Só pesquisa.
- Os prompts devem ter perguntas NUMERADAS (1., 2., 3.) e pedir resultados em **tabelas** sempre que possível.
- Adaptar o vocabulário ao idioma do utilizador (PT-PT vs PT-BR vs EN).
- Se o utilizador não souber a região, sugerir "Brasil" (PT-BR) ou "Portugal" (PT-PT) com base no idioma da conversa.
- Se o utilizador escolheu uma opção que NÃO precisa de SEO (ex: 13. API, 14. Dashboard interno), o ficheiro `02-keywords-seo.md` deve focar em "documentação técnica + comunidades de developers" em vez de "Google search trends".

## Referência

- Guia completo: `metodo/00-fase-pesquisa.md`
- Template de coleta: `~/.claude/skills/akita-method/templates/DADOS-PROJETO-TEMPLATE.md`
