# Guia Rápido — Comece em 5 Minutos

> Versão express do método para quem quer começar agora.
> Para a versão completa, leia os documentos na pasta `metodo/`.

---

## Pré-requisitos

- Computador com terminal (Windows, Mac, Linux)
- [Claude Code](https://docs.claude.com/claude-code) instalado
- `git` instalado
- Vontade de aprender fazendo

Não precisa saber programar para começar. O método guia você.

---

## Passo 1 — Instale o Claude Code Super Power

### Modo fácil (sem terminal)

Abra o Claude Code (em qualquer pasta) e cole exactamente isto:

```
Instala o Claude Code Super Power para mim.
Repositório: https://github.com/johnnyhelder/claude-code-super-power

Segue as instruções de INSTALL.md no repositório.
Confirma comigo antes de qualquer comando destrutivo.
```

O agente trata de tudo: clone, copy, configure. Em 30 segundos está pronto.

### Modo terminal (alternativa)

Se preferir, ou se o agente não tiver permissões:

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

Em qualquer dos modos, você fica com:
- Skill `akita-method` em `~/.claude/skills/`
- 5 slash commands `/super-power:*` em `~/.claude/commands/super-power/`

---

## Passo 2 — Escolha um projeto pequeno

Não comece com "um SaaS que vai mudar o mundo". Comece com algo simples:

- Um site pessoal
- Uma landing page
- Um blog
- Uma calculadora útil
- Um bot simples

O projeto é para **aprender o método**, não para ganhar dinheiro (ainda).

---

## Passo 3 — Crie a pasta e abra o Claude Code

```bash
mkdir meu-projeto && cd meu-projeto
claude
```

---

## Passo 4 — Pesquisa conversacional (Fase 0)

Dentro do Claude Code:

```
/super-power:research
```

O Claude conversa contigo em **3 etapas** simples:

1. **Briefing livre** — escreves em texto corrido sobre o projeto, negócio, envolvidos e problema
2. **7 perguntas** — Claude pergunta de uma só vez: público, dor, como resolvem hoje, diferencial, canais, modelo de receita, sucesso em 90 dias
3. **Pesquisa automática** — Claude faz ~10 buscas web cobrindo mercado, concorrência, SEO, perfil dos envolvidos, e tendências. Resultado num único ficheiro: `pesquisas/00-deep-research.md`

Tudo dentro do Claude Code. Zero copy-paste para outras ferramentas.

> **Opção alternativa:** Se preferires pesquisa MAIS profunda, o Claude oferece-te a opção de gerar 1 prompt para Gemini Deep Research (gratuito), e depois importa o resultado de volta.

---

## Passo 5 — Consolide a pesquisa em planeamento

```
/super-power:plan
```

O Claude lê a pesquisa e gera **4 ficheiros base** na raiz, com **framework de marketing digital aplicado**:

- `PLAN.md` — planta do projeto + persona + jornada + funil TOFU/MOFU/BOFU + KPIs
- `CLAUDE.md` — cérebro do agente (com 4 princípios Karpathy pré-injetados)
- `PROJECT.md` — visão e roadmap + plano de marketing inicial
- `NOW.md` — handoff entre sessões

Os 4 princípios universais do CLAUDE.md são:
1. Pensar antes de codar
2. Simplicidade primeiro
3. Mudanças cirúrgicas
4. Execução orientada por objetivo

---

## Passo 6 — Comece a Fase 1

```
/super-power:start
```

Configura `.claude/settings.json` com permissões granulares, cria estrutura de pastas, inicializa git. **ZERO código de negócio.**

---

## Passo 7 — Avance fase por fase

| Comando | Fase |
|---------|------|
| `/super-power:phase 2` | Fundação — CLAUDE.md 200+ linhas |
| `/super-power:phase 3` | Testes — TDD puro, todos falhando |
| `/super-power:phase 4` | Implementação — código guiado pelos testes |
| `/super-power:phase 5` | Otimização — performance e refactoring |
| `/super-power:phase 6` | Interface — polir apresentação |
| `/super-power:phase 7` | Deploy — CI/CD automatizado |

A qualquer momento:

```
/super-power:status
```

Mostra onde você está, o que falta, e o próximo comando recomendado.

---

## As 3 regras de ouro

### 1. Nunca aceite código que você não entende
Se a IA gerou algo e você não sabe o que faz, peça para ela explicar. Se ainda não entendeu, peça para simplificar. Não cole código às cegas.

### 2. Teste antes, código depois
Parece contraintuitivo, mas funciona: primeiro descreva o que o código DEVE fazer (teste), depois peça o código. Assim você sabe se funcionou.

### 3. Se a IA errar, ensine — não corrija
Quando a IA fizer algo errado, não vá lá e mude o código na mão. Explique o erro de volta para ela. E anote o erro no CLAUDE.md para que não se repita.

---

## Próximos passos

Depois de completar o Desafio dos 7 Dias:

1. **Leia os documentos do método** na pasta `metodo/` para entender a teoria
2. **Aplique num projeto real** — agora com confiança
3. **Use as ferramentas auxiliares**: `convoca o conselho` (LLM Council), `/graphify .` (mapear codebase), Context7 (docs ao vivo)
4. **Contribua** — compartilhe sua experiência em [CONTRIBUTING.md](CONTRIBUTING.md)

---

## Dúvidas frequentes

**"Qual IA devo usar?"**
Este repo é optimizado para **Claude Code**. O método funciona com outras IAs (ChatGPT, Cursor, etc.), mas os slash commands `/super-power:*` são específicos do Claude Code.

**"Preciso saber programar?"**
Ajuda, mas não é obrigatório. O método ensina você a **pensar como engenheiro** antes de escrever código. A IA faz a parte técnica, você faz a parte estratégica.

**"Quanto tempo leva?"**
O Desafio dos 7 Dias pode ser feito em 7-14 dias reais, dedicando 1-2 horas por dia. Depois disso, cada novo projeto fica mais rápido.

**"E se eu já sei programar?"**
Melhor ainda. Pule o básico e foque nos testes (Fase 3) e no CI/CD (Fase 7) — que é provavelmente o que está faltando nos seus projetos.

**"Posso usar isso em projetos existentes?"**
Sim. Em vez de `/super-power:research`, comece com `/graphify .` para mapear o que já existe, depois rode `/super-power:plan` para gerar PLAN.md/CLAUDE.md retroactivamente.
