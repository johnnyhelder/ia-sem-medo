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

## ✨ FASE 01 — Instale (sem terminal)

> **DICA — O CLAUDE FAZ TUDO POR VOCÊ**
> Você não precisa saber nada de terminal, git ou shell. Só precisa abrir o Claude Code e colar uma frase.

### Passo único

1. Abra o **Claude Code** numa pasta qualquer (pode ser `~/`):

   ```bash
   claude
   ```

2. Cole exactamente isto na conversa:

   ```
   Instala o Claude Code Super Power para mim.
   Repositório: https://github.com/johnnyhelder/claude-code-super-power

   Segue as instruções de INSTALL.md no repositório.
   Confirma comigo antes de qualquer comando destrutivo.
   ```

3. **Pronto.** O agente vai:
   - Clonar o repositório
   - Copiar a skill para `~/.claude/skills/akita-method/`
   - Copiar 5 slash commands para `~/.claude/commands/super-power/`
   - Confirmar que está tudo no sítio

Tempo: ~30 segundos. Não toca nos seus projetos existentes — só configura o `~/.claude/` global.

> **ATENÇÃO — SE O CLAUDE NÃO INSTALAR SOZINHO**
> Algumas configurações de permissões impedem o agente de clonar repositórios. Nesse caso, use o método alternativo abaixo.

### 🛠️ Alternativa — terminal (uma linha)

Se preferir terminal, ou se o método acima não funcionar:

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

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
| **1** | `/super-power:research` | Gera 4 prompts de pesquisa em `pesquisas/` (mercado, SEO, concorrência, ferramentas) |
| **2** | (cole os prompts no Gemini Deep Research, copie as respostas de volta) | |
| **3** | `/super-power:plan` | Consolida pesquisas em `PLAN.md` + `CLAUDE.md` + `PROJECT.md` + `NOW.md` |
| **4** | `/super-power:start` | Fase 1 — `.claude/settings.json` com permissões + estrutura inicial |
| **5** | `/super-power:phase 2` | Fase 2 — Fundação completa (CLAUDE.md 200+ linhas) |
| **6** | `/super-power:phase 3` | Fase 3 — TDD: todos os testes ANTES de qualquer código |
| **7** | `/super-power:phase 4` | Fase 4 — código implementado, testes verdes |
| **8** | `/super-power:phase 5` | Fase 5 — otimização |
| **9** | `/super-power:phase 6` | Fase 6 — interface e conteúdo |
| **10** | `/super-power:phase 7` | Fase 7 — deploy com CI/CD |

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

## 🗑️ Desinstalar

Mudaste de ideias? Sem ressentimentos. Numa linha de terminal:

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/uninstall.sh | bash
```

Ou via Claude Code:

```
/super-power:uninstall
```

Remove `~/.claude/skills/akita-method/` e `~/.claude/commands/super-power/`. Os teus projetos não são tocados.

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
