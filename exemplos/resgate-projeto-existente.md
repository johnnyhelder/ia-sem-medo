# Como Aplicar em Projetos Existentes (Resgate)

## O cenário

Você já tem um projeto a rodar — talvez até em produção. O problema: sem testes, sem CI/CD, sem documentação. Qualquer mudança pode quebrar algo.

## Pré-requisito: instalar o `claude-code-super-power`

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

## O fluxo de resgate

### 1. Mapear o que já existe — Graphify

Antes de tocar em qualquer coisa, ver o que está lá:

```bash
cd projeto-existente
claude
```

Dentro do Claude Code:

```
/graphify .
```

Em 5-10 minutos você tem:
- `graph.html` — mapa visual de dependências (abrir no browser)
- `GRAPH_REPORT.md` — god-nodes (candidatos a refactor), comunidades, ligações surpreendentes
- Perguntas sugeridas como "Como o auth conecta ao admin panel?"

Isto é Fase 0 retroactiva: pesquisa antes de tocar.

### 2. Diagnóstico do estado actual

Compare o seu projeto contra esta tabela:

| O que verificar | Existe? |
|-----------------|---------|
| Testes automatizados | ❌ / ✅ |
| Pipeline CI/CD | ❌ / ✅ |
| CLAUDE.md ou documentação | ❌ / ✅ |
| Lint / formatação | ❌ / ✅ |
| `.claude/settings.json` com permissões | ❌ / ✅ |
| Deploy automatizado | ❌ / ✅ |

### 3. Sprint 1 — Testes (PRIORIDADE MÁXIMA)

Instale um framework de testes e crie 15-20 testes básicos que cobrem:
- Build compila sem erros
- Páginas/endpoints respondem
- Dados obrigatórios estão presentes
- SEO básico (se for site)
- Nenhum secret exposto

**Por que é prioridade:** Sem testes, tudo o resto é arriscado. Os testes são a rede de segurança que permite fazer tudo o que vem depois com confiança.

Use o template como referência:

```bash
cat ~/.claude/skills/akita-method/templates/TESTES-BASE.md
```

### 4. Sprint 2 — Documentação retroactiva

Em vez de `/super-power:plan` (que assume projeto novo), crie o CLAUDE.md à mão documentando o projeto COMO ELE É HOJE:
- Stack actual (versões exactas)
- Estrutura de pastas
- APIs e endpoints
- Regras de negócio
- Decisões já tomadas (e por quê)

Use o template como base — copie a Parte A (4 princípios Karpathy) literalmente, preencha a Parte B com a realidade actual:

```bash
cp ~/.claude/skills/akita-method/templates/CLAUDE-MD-TEMPLATE.md CLAUDE.md
```

### 5. Sprint 3 — Setup Seguro retroactivo

```
/super-power:start
```

Vai criar `.claude/settings.json` com permissões. Adapte à stack do seu projeto.

### 6. Sprint 4 — CI/CD

Crie pipeline que bloqueia deploy se algo falhar:

```
push → lint → testes → build → deploy
```

Templates: `~/.claude/skills/akita-method/templates/CI-CD-TEMPLATE.md`

### 7. Sprint 5 — Continuar com método normal

Com testes, CI/CD, CLAUDE.md e settings configurados, o projeto está "resgatado". Novas features seguem o fluxo normal:

```
/super-power:phase 3    # Escrever teste
/super-power:phase 4    # Implementar
```

## Casos reais

Testámos este processo em dois projetos reais:
- **Site estático (Astro):** de 0 testes para 15+ testes em 1 sprint
- **App completa (Next.js + Prisma + AI SDK):** de 0 testes para 28+ testes em 1 sprint

Ambos os projetos estavam em produção e funcionavam. Mas qualquer mudança era "no escuro". Depois do resgate, mudanças passaram a ser validadas automaticamente.

## Quando NÃO resgatar

Se o projeto está abandonado e você não vai mantê-lo, não vale a pena. Resgate é para projetos vivos onde você vai continuar a trabalhar.
