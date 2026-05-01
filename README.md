# 🦾 Claude Code Super Power

### O kit que transforma Claude Code num parceiro de engenharia sénior — instalável em UMA frase.

[![Licença MIT](https://img.shields.io/badge/licen%C3%A7a-MIT-green.svg)](LICENSE)
[![PRs Bem-vindos](https://img.shields.io/badge/PRs-bem--vindos-brightgreen.svg)](CONTRIBUTING.md)

> **Anti-vibe coding sem dor de cabeça.**
> Você cola UMA frase no Claude Code. Em 30 segundos o agente instala skill, slash commands e templates. Pronto para projetos sérios desde o primeiro commit.

---

## Por que existe

| Problema clássico de "vibe coding" | O que o Claude Code Super Power resolve |
|--|--|
| "A IA fez um monte de código e eu não entendi nada" | Você decide. A IA executa. Pair programming real. |
| "Funcionou... mas tenho medo de mexer" | TDD obrigatório. Testes primeiro, código depois. |
| "Cada feature nova quebra outra" | Rede de testes garante que mudanças não quebram nada. |
| "Parece loteria" | Método replicável. Próximo projeto vai mais rápido. |

Este repositório compila num só lugar:

- **O Método Akita** — anti-vibe coding em 7+1 fases
- **Os 4 Princípios Karpathy** — anti-erro de LLM em código
- **Template Anthropic** — `CLAUDE.md` como cérebro do agente
- **Ferramentas curadas** — Context7, LLM Council, Graphify

---

## ✨ FASE 01 — Instale (no projeto, sem fricção)

> **A skill instala-se na pasta do TEU projeto** (`.claude/` local), não no `~/.claude/` global.
> Sem auto-mode bloqueio. Sem permissões para autorizar. Sem ambiguidade.
> Cada projeto onde queres usar a skill, instalas lá uma vez (3 segundos via 1 frase).

### Passo único

1. Abre o terminal e vai para a pasta do projecto onde queres usar a skill:

   ```bash
   mkdir meu-projeto && cd meu-projeto
   claude
   ```

2. Cola exactamente isto no Claude Code:

   ```
   Instala o Claude Code Super Power nesta pasta.
   Repositório: https://github.com/johnnyhelder/claude-code-super-power

   Cria .claude/skills/akita-method/ e .claude/commands/super-power/
   AQUI nesta pasta (não em ~/.claude global).

   Eu autorizo. Procede.
   ```

3. **Pronto.** O agente vai:
   - Clonar o repositório (para `/tmp/`)
   - Copiar a skill para `./.claude/skills/akita-method/`
   - Copiar slash commands para `./.claude/commands/super-power/`
   - Confirmar que está tudo no sítio

Tempo: ~10 segundos. **Outros projetos não são afectados** — só este.

### 🛠️ Alternativa — terminal (uma linha)

Se preferires terminal:

```bash
# Local (default — recomendado)
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash

# Global (todos os projetos — pode ter fricção com auto-mode)
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash -s -- --global
```

> **Porquê instalação LOCAL como default?**
> O Claude Code tem proteção contra self-modification em `~/.claude/` (ele bloqueia escrita global por skills externas). Instalar **localmente** (no `.claude/` do projecto) **passa essa proteção** porque não é self-modification global, é só criar ficheiros num projeto teu. Resultado: sem fricção, sem permissões para autorizar.

O `install.sh` faz exactamente o mesmo: clone, copy, configure. Ideal para máquinas sem Claude Code ainda configurado.

---

## FASE 02 — Primeiro projeto

Crie a pasta do projeto, abra o Claude Code, e execute os comandos por ordem:

```bash
mkdir meu-projeto && cd meu-projeto
claude
```

Depois, dentro do Claude Code:

| Passo | Comando | O que acontece |
|---|---|---|
| **1** | `/super-power:research` | Conversa contigo (briefing + 7 perguntas) e faz a pesquisa profunda automática (~10 buscas web). Resultado em `pesquisas/00-deep-research.md`. Tudo dentro do Claude Code. |
| **2** | `/super-power:plan` | Lê a pesquisa e gera `PLAN.md` + `CLAUDE.md` + `PROJECT.md` + `NOW.md` com framework de marketing digital aplicado (persona, jornada, funil, KPIs) |
| **3** | `/super-power:start` | Fase 1 — `.claude/settings.json` com permissões + estrutura inicial |
| **4** | `/super-power:phase 2` | Fase 2 — Fundação completa (CLAUDE.md 200+ linhas) |
| **5** | `/super-power:phase 3` | Fase 3 — TDD: todos os testes ANTES de qualquer código |
| **6** | `/super-power:phase 4` | Fase 4 — código implementado, testes verdes |
| **7** | `/super-power:phase 5` | Fase 5 — otimização |
| **8** | `/super-power:phase 6` | Fase 6 — interface e conteúdo |
| **9** | `/super-power:phase 7` | Fase 7 — deploy com CI/CD |

> **DICA — PESQUISA EXTERNA OPCIONAL**
> Se preferires pesquisa MAIS profunda, o `/super-power:research` oferece também a opção de gerar 1 prompt mestre para o **Gemini Deep Research** (gratuito). Esperas o relatório lá, voltas com o link público ou o conteúdo, e o Claude importa. Para o caso de o link ser SPA pesado, podes precisar de [Firecrawl](ferramentas/firecrawl-instalacao.md) (free tier 500 req/mês chega).

> **A QUALQUER momento:** `/super-power:status` mostra onde você está, o que falta, e o que fazer a seguir.

---

## FASE 03 — Os 4 princípios universais

Toda vez que `/super-power:plan` gera um `CLAUDE.md`, estes 4 princípios são pré-injetados no topo. O agente lê e segue automaticamente:

| Princípio | O que faz |
|---|---|
| **1. Pensar antes de codar** | Trazer suposições, trade-offs e dúvidas à tona — não escolher em silêncio |
| **2. Simplicidade primeiro** | Código mínimo. Sem features especulativas. Sem abstrações para uso único. |
| **3. Mudanças cirúrgicas** | Tocar só no que for necessário. Não "melhorar" código adjacente. |
| **4. Execução orientada por objetivo** | Definir critérios verificáveis. Iterar até o teste passar. |

Detalhe completo: [`principios/4-principios-karpathy.md`](principios/4-principios-karpathy.md)

> **ATENÇÃO — TRADE-OFF**
> Estes princípios privilegiam **cautela sobre velocidade**. Para tarefas triviais (typo, one-liner óbvio), use bom senso. O objetivo é reduzir erros caros em trabalho não-trivial.

---

## FASE 04 — Ferramentas auxiliares

Três ferramentas curadas que se integram ao método. Use quando o cenário pedir:

| Ferramenta | Quando usar | Como invocar |
|---|---|---|
| **[Context7](ferramentas/context7.md)** | Setup de qualquer lib/framework — busca docs reais ao vivo, sem confiar em training data | Automático (com regra global) |
| **[LLM Council](ferramentas/llm-council.md)** | Decisões caras com trade-offs (lançar X ou Y? mudar posicionamento?) | `convoca o conselho` |
| **[Graphify](ferramentas/graphify.md)** | Mapear codebase legacy ou validar arquitectura na Fase 5 | `/graphify .` |
| **[Firecrawl](ferramentas/firecrawl-instalacao.md)** | Importar pesquisas externas (Gemini Deep Research) via link, scraping de concorrentes | Opcional — só se WebFetch falhar |

---

## O que tem dentro deste repositório

```
claude-code-super-power/
│
├── install.sh                       INSTALADOR (curl-able)
├── README.md                        este ficheiro
│
├── principios/                      PRINCÍPIOS UNIVERSAIS
│   └── 4-principios-karpathy.md     Os 4 princípios anti-erro de LLM
│
├── metodo/                          MÉTODO COMPLETO (8 docs)
│   ├── 00-fase-pesquisa.md          Como pesquisar antes de programar
│   ├── 01-filosofia.md              Anti-Vibe Coding e XP
│   ├── 02-fluxo-completo.md         As 7+1 fases
│   ├── 03-tdd-com-ia.md             Testes como rede de segurança
│   ├── 04-pair-programming-ia.md    Você navega, a IA pilota
│   ├── 05-gestao-estimativas.md     Pessoas > métricas
│   ├── 06-ferramentas-stack.md      Stacks recomendadas
│   └── 07-desafio-7-dias.md         Imersão prática
│
├── ferramentas/                     FERRAMENTAS AUXILIARES
│   ├── context7.md                  Docs sempre frescas via MCP
│   ├── llm-council.md               5 conselheiros para decisões caras
│   └── graphify.md                  Mapear corpus em grafo
│
├── skill/akita-method/              SKILL DO CLAUDE CODE
│   ├── SKILL.md                     Orquestrador
│   └── templates/                   Templates copiáveis
│       ├── PLAN-TEMPLATE.md
│       ├── CLAUDE-MD-TEMPLATE.md    (4 princípios pré-injetados)
│       ├── DADOS-PROJETO-TEMPLATE.md
│       ├── TESTES-BASE.md
│       └── CI-CD-TEMPLATE.md
│
├── commands/                        SLASH COMMANDS
│   ├── research.md                  /super-power:research
│   ├── plan.md                      /super-power:plan
│   ├── start.md                     /super-power:start
│   ├── phase.md                     /super-power:phase N
│   └── status.md                    /super-power:status
│
├── exemplos/                        CASOS PRÁTICOS
├── fontes/                          MATERIAL DE PESQUISA
├── COMO-FOI-FEITO.md                história deste método
├── CREDITOS.md                      Akita + Karpathy + Anthropic + Safi + outros
├── GUIA-RAPIDO.md                   versão express
├── CONTRIBUTING.md                  como contribuir
└── LICENSE                          MIT
```

---

## Para quem é

- ✓ Quer criar um projeto Claude Code **sem vibe coding**
- ✓ Já tentou IA para programar e se frustrou com a inconsistência
- ✓ Quer um método que **funciona no segundo projeto também**
- ✓ Está começando e quer **aprender o método antes da ferramenta**
- ✓ Já programa e quer **acelerar com segurança**

❌ NÃO é para quem quer um prompt mágico. Isso não existe.

---

## "Mas eu não sei programar..."

Tudo bem. O método foi pensado para vários níveis:

- **Iniciante:** Siga os comandos por ordem. Os templates guiam você.
- **Já programa:** Use a skill como aceleração. Pule o que já sabe.
- **Lidera equipa:** Os princípios de gestão (`metodo/05`) mudam como você vê produtividade.

A diferença entre "usar IA" e "usar IA com método" é a diferença entre **torcer para funcionar** e **saber que funciona**.

---

## O Desafio dos 7 Dias

O coração deste método é o **Desafio dos 7 Dias** proposto pelo Akita: criar um projeto pequeno do zero à produção em 7 dias (1-2h por dia), seguindo TODAS as fases.

| Dia | Foco | Comando |
|-----|------|---------|
| 1 | Setup seguro | `/super-power:start` |
| 2 | Fundação completa | `/super-power:phase 2` |
| 3 | Testes (Red) | `/super-power:phase 3` |
| 4 | Código (Green) | `/super-power:phase 4` |
| 5 | Otimização | `/super-power:phase 5` |
| 6 | Interface | `/super-power:phase 6` |
| 7 | Deploy + CI/CD | `/super-power:phase 7` |

Detalhe: [`metodo/07-desafio-7-dias.md`](metodo/07-desafio-7-dias.md)

---

## Contribua

Encontrou um bug? Tem uma melhoria? Completou o desafio? Leia [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Créditos

Este repositório é uma **compilação e adaptação** de trabalho público de várias pessoas. Veja [CREDITOS.md](CREDITOS.md) para a lista completa, com links às fontes originais:

- **Fábio Akita** — Método Anti-Vibe Coding e princípios de engenharia
- **Andrej Karpathy** — Os 4 princípios de comportamento de LLMs em código
- **Forrest Chang** — Empacotamento Karpathy → CLAUDE.md (104k stars)
- **Anthropic** — Template público de CLAUDE.md
- **Safi Shamsi** — Skill `graphify` para mapeamento de corpus
- **Gestor de Audiência** — Versão PT-BR do LLM Council e tutorial de instalação
- **Mano Davin** — Vídeo que organizou o método Akita pela primeira vez

---

## ⚡ Apoie o projecto

Se este método te poupou tempo, dor de cabeça, ou um projecto inteiro a explodir em produção, considera apoiar:

**Bitcoin (BTC):**

```
bc1q2n4p3zge5sj2pecjwxwmgape39taydjtq88cm9
```

Cada satoshi conta. Os fundos vão para manter este e outros projectos públicos vivos.

---

## 💬 Gestão em linguagem natural

> **Depois de instalado, fala em PT/EN com o Claude Code. Sem comandos shell, sem flags, sem cache.**
> O agente entende o que queres, pergunta confirmação se for destrutivo, e executa Bash directo.

### Atualizar para a versão mais recente

Cola no Claude Code (em qualquer pasta):

```
Atualiza o claude-code-super-power para a versão mais recente
```

(Aceita variações: "atualiza super power", "actualiza super power", "upgrade super power", "instala a versão nova", etc.)

O agente faz backup automático da versão actual e instala a nova.

### Desinstalar

```
Desinstala o claude-code-super-power
```

(Aceita: "remove super power", "apaga super power", "tira super power")

O agente pergunta-te o modo:
- **SOFT** — move para `.deleted.<timestamp>` (recuperável)
- **HARD** — apaga definitivamente
- **CLEAN-ALL** — apaga tudo + remove backups antigos acumulados

### Limpar backups antigos acumulados

Se já actualizaste várias vezes e tens muitos `.backup.*` ou `.deleted.*`:

```
Limpa os backups antigos do super-power
```

### Ver versão instalada

```
Que versão do super-power tenho instalada?
```

### Slash commands (alternativa para quem prefere comandos)

| Comando | O que faz |
|---|---|
| `/super-power:research` | Fase 0 — briefing + 7 perguntas + pesquisa deep |
| `/super-power:plan` | Gera PLAN.md + CLAUDE.md + PROJECT.md + NOW.md |
| `/super-power:start` | Fase 1 — setup seguro |
| `/super-power:phase N` | Avança para Fase N (2-7) |
| `/super-power:status` | Mostra estado do projeto |
| `/super-power:version` | Mostra versão instalada + backups acumulados |
| `/super-power:update` | Atualiza para versão mais recente |
| `/super-power:uninstall [modo]` | Remove (soft / hard / clean-all / backups-only) |

### Fallback raro — terminal

Se por algum motivo o Claude Code não estiver acessível, há scripts shell:

```bash
# Reinstalar
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash

# Desinstalar (interactivo)
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/uninstall.sh | bash

# Desinstalar tudo + backups (sem confirmação)
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/uninstall.sh | bash -s -- --hard --yes --clean-backups
```

> **Mas usa-os só se mesmo precisares.** A UX recomendada é falar com o Claude.

Em qualquer modo: **os teus projetos não são tocados** — só `~/.claude/skills/akita-method/` e `~/.claude/commands/super-power/`.

---

## Licença

MIT — use, modifique, distribua. Mantenha os créditos.

---

<p align="center">
  <strong>"Ganha quem comete o penúltimo erro."</strong><br>
  <em>— Tartakower (adaptado para projetos com IA)</em>
</p>

<p align="center">
  Compilado por <a href="https://johnnyhelder.com">Johnny Helder</a>
</p>
