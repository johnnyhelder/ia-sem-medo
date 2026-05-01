# Como Aplicar em Projetos Novos (do Zero)

## O cenário

Você vai criar algo novo — um site, uma app, uma API, um bot. Ainda não existe código nenhum.

## Pré-requisito: instalar o `claude-code-super-power`

Uma única linha no terminal (uma vez por máquina):

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

Em ~30 segundos, a skill `akita-method` e os 5 slash commands `/super-power:*` ficam disponíveis em todos os seus projetos Claude Code.

## O fluxo completo

### 1. Crie a pasta e abra o Claude Code

```bash
mkdir meu-projeto && cd meu-projeto
claude
```

### 2. Fase 0 — Pesquisa antes de programar

```
/super-power:research
```

A skill cria 4 ficheiros em `pesquisas/` com prompts prontos:

- `01-mercado.md` — concorrentes, faixas de preço, oportunidades
- `02-keywords-seo.md` — o que o público busca no Google
- `03-concorrencia.md` — análise digital dos top 5
- `04-ferramentas.md` — qual stack escolher

Cole cada prompt no Gemini Deep Research (ou ChatGPT/Perplexity), copie a resposta de volta para o ficheiro.

### 3. Fase de Plano — Consolidar pesquisas

```
/super-power:plan
```

Gera 4 ficheiros base com base nas pesquisas:
- `PLAN.md` — planta do projeto
- `CLAUDE.md` — cérebro do agente (4 princípios Karpathy pré-injetados)
- `PROJECT.md` — visão e roadmap
- `NOW.md` — handoff entre sessões

### 4. Fase 1 — Setup Seguro

```
/super-power:start
```

Configura `.claude/settings.json` com permissões granulares, cria estrutura de pastas, inicializa git. **Zero código de negócio.**

### 5. Avance fase por fase

```
/super-power:phase 2    # Fundação completa
/super-power:phase 3    # Testes (TDD puro, todos falhando)
/super-power:phase 4    # Código guiado pelos testes
/super-power:phase 5    # Otimização
/super-power:phase 6    # Interface
/super-power:phase 7    # Deploy + CI/CD
```

A qualquer momento:

```
/super-power:status
```

Mostra onde você está e o próximo comando recomendado.

### 6. Use ferramentas auxiliares quando o cenário pedir

| Cenário | Ferramenta | Comando |
|---------|------------|---------|
| Decisão arquitectural com trade-offs | LLM Council | `convoca o conselho` |
| Setup de lib nova | Context7 | (automático com regra global) |
| Validar arquitectura na Fase 5 | Graphify | `/graphify .` |

## O resultado

No final do fluxo você terá: projeto a funcionar em produção, com testes automatizados, CI/CD pipeline, e documentação completa. Qualquer mudança futura será segura porque os testes pegam problemas antes do deploy.

## Tempo realista

- **Iniciante absoluto:** 7-14 dias (1-2h por dia)
- **Já programa:** 3-5 dias
- **Engenheiro experiente:** 1-2 dias

A diferença está no tempo de pesquisa (Fase 0) e na curva de aprendizagem do método. As fases técnicas (3 a 7) são rápidas para quem já programa.
