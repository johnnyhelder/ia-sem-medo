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

### Simulação: Projeto Diene Marinho
Primeiro fizemos uma simulação teórica — pegamos um projeto real (site de uma massoterapeuta em Lisboa, já em produção) e mapeamos como seria aplicar o método retroativamente. Isso revelou o conceito de "Resgate": aplicar o método em projetos que já existem.

### Resgate real: Diene Marinho
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

O resultado é este repositório.

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
