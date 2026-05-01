# Como Este Método Foi Criado

> A história por trás do repositório — de uma live que "quebrou a internet" até um método prático que qualquer pessoa pode usar.

---

## O ponto de partida

Tudo começou com uma live. O Fábio Akita — que muita gente achava que odiava IA — apareceu num podcast e mostrou que na verdade ele usa IA de forma **mais intensa** que a maioria. A diferença: ele usa com **método, disciplina e engenharia**. Não é "vibe coding". É o oposto.

A live gerou um vídeo do canal Mano Davin chamado "O Método Fábio Akita para programar com IA", que organizou os conceitos de forma acessível. Aquilo acendeu uma lâmpada: esses princípios podiam ser **extraídos, documentados e transformados num sistema reutilizável**.

---

## O processo de pesquisa

### Passo 1 — Transcrever o vídeo
Começamos pelo vídeo do Mano Davin. Transcrevemos os 45 minutos completos para ter acesso ao texto integral dos conceitos apresentados.

### Passo 2 — Pesquisa profunda com IA
Criamos um prompt extenso e estruturado para o Gemini Deep Research, pedindo uma pesquisa exaustiva sobre o Fábio Akita e seu método. O prompt incluía 10 fontes obrigatórias (blog posts, vídeos, newsletter, gists) e 6 blocos temáticos para documentar.

O Gemini retornou um documento de dezenas de páginas cobrindo a trajetória do Akita, a filosofia de engenharia dele, o método completo de projeto, o case study do The M.Akita Chronicles, a visão de gestão, e a stack de ferramentas.

### Passo 3 — Pesquisa complementar nas fontes originais
Não ficamos apenas no Gemini. Fomos direto às fontes:
- Blog akitaonrails.com — especialmente a série "Bastidores do The M.Akita Chronicles"
- Vídeos do canal Akitando (#76, #120, #130, #144)
- Newsletter The M.Akita Chronicles
- Gist no GitHub com os prompts originais da newsletter
- Posts no LinkedIn e discussões em fóruns

### Passo 4 — Organizar o conhecimento
Com todo o material bruto coletado, organizamos em 7 documentos de princípios temáticos:

1. Filosofia (Anti-Vibe Coding, XP, Build to Earn vs Learn)
2. Método de Projeto Completo (PLAN.md → CLAUDE.md → Deploy)
3. TDD e Testes com IA (7 camadas, mocks, rede de segurança)
4. Pair Programming com IA (Humano=Navegador, IA=Piloto)
5. Gestão e Estimativas (pessoas > métricas, priorização)
6. Ferramentas e Stack (tudo que o Akita usa e recomenda)
7. Desafio dos 7 Dias (a imersão prática)

---

## Transformar em ferramenta prática

### Criação da Skill
Estudamos a estrutura de Skills do Claude (como elas funcionam, o formato YAML + Markdown, a hierarquia de progressive disclosure) e criamos uma Skill que orquestra o método completo. Quando o Claude lê essa Skill, ele segue as 7+1 fases automaticamente.

### Criação dos Templates
Para cada fase do método, criamos templates copiáveis:
- **PLAN-TEMPLATE.md** — para documentar o projeto antes do código
- **CLAUDE-MD-TEMPLATE.md** — para dar contexto total ao agente de IA
- **DADOS-PROJETO-TEMPLATE.md** — para coletar informações do cliente/projeto
- **TESTES-BASE.md** — exemplos de testes para sites, APIs, apps e bots
- **CI-CD-TEMPLATE.md** — pipelines prontos para GitHub Actions

---

## Testar na prática

### Simulação: Projeto de uma cliente
Primeiro fizemos uma simulação teórica — pegamos um projeto real (site de uma massoterapeuta em Lisboa, já em produção) e mapeamos como seria aplicar o método retroativamente. Isso revelou o conceito de "Resgate": aplicar o método em projetos que já existem.

### Resgate real: Projeto de uma cliente
Aplicamos o Sprint 1 do resgate no projeto real — instalamos Vitest, criamos 15-20 testes automatizados cobrindo build, blog, SEO, APIs e acessibilidade. Resultado: o projeto que tinha ZERO testes passou a ter uma rede de segurança funcional.

### Resgate real: johnnyhelder.com
Repetimos o processo num projeto mais complexo (Next.js 14 com TypeScript, Prisma, NextAuth, AI SDK, 6 API routes). Diagnóstico, criação de ~28 testes, mesma dinâmica.

### O que aprendemos
O método funciona tanto para projetos novos quanto para projetos existentes. A adaptação é simples: em projetos novos, segues as 7 fases em ordem. Em projetos existentes, fazes um diagnóstico e preenches o que falta (geralmente testes e CI/CD).

---

## De projeto interno para repositório público

Com o método testado na prática, decidimos abrir tudo:
- Reescrevemos os documentos para serem acessíveis a iniciantes
- Criamos o README acolhedor para quem não é programador
- Organizamos a estrutura do repositório para ser intuitiva
- Adicionamos exemplos práticos de uso
- Documentamos todos os créditos e referências

---

## Reestruturação para `claude-code-poderoso`

Em maio de 2026, fizemos uma reestruturação completa para transformar o repositório de uma documentação do método Akita num **kit de instalação único para Claude Code**. Os passos:

### 1. Compilar fontes externas
Identificamos quatro fontes públicas de alta qualidade que complementam o método Akita e integramos a todas:

- **Andrej Karpathy** — observações sobre erros de LLM em código → 4 princípios universais
- **Forrest Chang** ([forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills), 104k stars) — empacotamento dos 4 princípios como CLAUDE.md
- **Anthropic** — template público de CLAUDE.md (Parte A + Parte B)
- **Safi Shamsi** ([graphify](https://github.com/safishamsi/graphify)) — skill de mapeamento de corpus em grafo
- **Gestor de Audiência** ([llm-council-skill-ptbr](https://github.com/gestordeaudiencia/llm-council-skill-ptbr)) — versão PT-BR do LLM Council + tutorial visual de instalação

### 2. Criar instalador one-liner
Escrevemos um `install.sh` que pode ser executado via:

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-poderoso/main/install.sh | bash
```

O script clona o repositório, instala a skill em `~/.claude/skills/akita-method/` e os slash commands em `~/.claude/commands/poderoso/`. Uma única linha resolve toda a configuração.

### 3. Criar 5 slash commands

- `/poderoso:research` — gera prompts de pesquisa Fase 0
- `/poderoso:plan` — consolida pesquisas em PLAN.md + CLAUDE.md + PROJECT.md + NOW.md
- `/poderoso:start` — Fase 1 (setup seguro)
- `/poderoso:phase N` — avança para fase N (2-7)
- `/poderoso:status` — mostra estado actual

### 4. Genericizar referências a infra própria
A versão original do método Akita falava em "AI Jail" e Docker como camada obrigatória. Para tornar acessível a iniciantes, transformamos isto em "Setup Seguro do Claude Code" focado em `.claude/settings.json` com permissões granulares. Docker passou a ser opcional para projetos de alto risco.

### 5. Adoptar estilo visual didático
Inspirados no tutorial PT-BR do Gestor de Audiência, adoptamos quadros visuais (DICA / ATENÇÃO / IMPORTANTE), tabelas numeradas por fase, e instruções passo-a-passo no README. Isto baixa drasticamente a barreira de entrada para quem nunca usou GitHub.

O resultado é este repositório: um kit completo, instalável em uma linha, que combina o melhor de cinco fontes públicas + o método Akita original.

---

## Ferramentas usadas no processo

| Ferramenta | Uso |
|------------|-----|
| Claude (Anthropic) | Pesquisa, organização, criação dos templates e Skill |
| Gemini Deep Research (Google) | Pesquisa exaustiva sobre o método Akita |
| GitHub | Repositório e versionamento |
| Claude Desktop (MCP) | Acesso direto aos projetos para diagnóstico e resgate |

---

## O convite

Este método não é fixo. Ele vai evoluir com a contribuição da comunidade. Se você usou, adaptou, melhorou — compartilhe. Leia o [CONTRIBUTING.md](CONTRIBUTING.md) e participe.
