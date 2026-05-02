# Template: CLAUDE.md

> Copiar, renomear para CLAUDE.md, e preencher com 200+ linhas de contexto.
> Este é o cérebro do agente. Quanto mais detalhado, menos alucinações.
> Atualizar SEMPRE que a IA errar ou que uma decisão mudar.

---

# CLAUDE.md — [Nome do Projeto]

Este ficheiro é carregado automaticamente pelo Claude Code em cada sessão. Define o comportamento base do agente neste projeto, mesclado com convenções específicas.

> **Trade-off:** estas diretrizes priorizam cautela sobre velocidade. Para tarefas triviais, usar bom senso.

---

## PARTE A — Princípios Universais (não editar entre projetos)

> Adaptado de [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) e do template público da Anthropic.

### 1. Pensar Antes de Codar

**Não suponha. Não esconda confusão. Traga trade-offs à tona.**

Antes de implementar:

- Declarar suposições explicitamente. Se em dúvida, perguntar.
- Se existirem múltiplas interpretações, apresentá-las. Não escolher em silêncio.
- Se houver abordagem mais simples, falar. Discordar quando fizer sentido.
- Se algo estiver confuso, parar. Nomear o que não está claro. Pedir clarificação.

### 2. Simplicidade Primeiro

**Código mínimo que resolve o problema. Nada especulativo.**

- Sem features além do pedido.
- Sem abstrações para código de uso único.
- Sem "flexibilidade" ou "configurabilidade" que não foi solicitada.
- Sem tratamento de erro para cenários impossíveis.
- Se 200 linhas poderiam ser 50, reescrever.

Pergunta de validação: "Um engenheiro sênior diria que isso está complicado demais?". Se sim, simplificar.

### 3. Mudanças Cirúrgicas

**Tocar só no que for necessário. Limpar só a própria bagunça.**

Ao editar código existente:

- Não "melhorar" código adjacente, comentários ou formatação.
- Não refatorar coisas que não estão quebradas.
- Combinar com o estilo existente, mesmo discordando dele.
- Se notar código morto não relacionado, mencionar — não deletar.

Quando suas mudanças criam órfãos:

- Remover imports/variáveis/funções que SUAS mudanças deixaram sem uso.
- Não remover código morto pré-existente sem ser pedido.

Teste: cada linha modificada deve traçar diretamente ao pedido do utilizador.

### 4. Execução Orientada por Objetivo

**Definir critérios de sucesso. Iterar até verificar.**

Transformar tarefas em objetivos verificáveis:

- "Adicionar validação" vira "escrever testes para inputs inválidos, depois fazer passar".
- "Corrigir o bug" vira "escrever um teste que reproduz o bug, depois fazer passar".
- "Refatorar X" vira "garantir que os testes passam antes e depois".

Para tarefas multi-passo, declarar plano breve:

```
1. [Passo] → verificar: [check]
2. [Passo] → verificar: [check]
3. [Passo] → verificar: [check]
```

Critérios de sucesso fortes permitem iterar de forma independente. Critérios fracos ("fazer funcionar") exigem clarificação constante.

---

## PARTE B — Específico do Projeto (preencher e ajustar)

### Sobre o Projeto

(2-3 frases: o que é, para quem, qual problema resolve)

### Stack Técnico

| Camada | Tecnologia | Versão | Notas |
|--------|-----------|--------|-------|
| Linguagem | | | |
| Framework | | | |
| Estilos | | | |
| Banco de dados | | | |
| Deploy | | | |
| CI/CD | | | |
| Testes | | | |

### Estrutura do Projeto

```
projeto/
├── README.md
├── PLAN.md
├── CLAUDE.md
├── NOW.md                       (handoff entre sessões)
├── src/
│   ├── (descrever cada pasta e o que contém)
│   └── ...
├── tests/
│   └── ...
├── docs/
│   └── ...
├── .claude/
│   ├── settings.json            (permissões)
│   └── CLAUDE.md                (link ou cópia deste ficheiro)
├── docker-compose.yml           (se aplicável)
└── .github/workflows/           (se aplicável)
```

### Variáveis de Ambiente

| Variável | Descrição | Exemplo |
|----------|-----------|---------|
| | | |

> NUNCA commitar valores reais. Usar `.env.example` com placeholders.

### Linguagem e Copy

(Adaptar ao público do projeto)

- Idioma: (PT-BR / PT-PT / EN). Tratamento "você/seu/sua" ou "tu/teu/tua".
- Proibições de estilo: (ex: travessões longos, "cadastro", urgência artificial)
- Tom: (formal / informal / educativo / técnico)

### Regras de Código

#### Obrigatórias

- (Nomenclatura: ficheiros, variáveis, classes)
- (Formatação: tabs vs spaces, max line length)
- (Organização: onde colocar models, services, utils)
- (Commits: conventional commits, idioma, tamanho)

#### Proibidas

- (O que a IA NÃO deve fazer — ex: "nunca usar `any` em TypeScript")
- (Padrões a evitar — ex: "nunca classes com +500 linhas")
- (Dependências proibidas — ex: "não instalar jQuery")

### Regras de Domínio / Negócio

(Regras específicas do negócio que a IA precisa saber)

Exemplos:
- "O nome correto é 'Maria da Silva', NÃO 'Maria Silva'"
- "Preços sempre em euros (€), formato: €XX,XX"
- "Tom: profissional mas acolhedor"

### Integrações Externas

| Serviço | Uso | Documentação | Limites |
|---------|-----|-------------|---------|
| | | | |

### Comandos Frequentes

```bash
# Desenvolvimento
(comando para iniciar dev server)

# Testes
(comando para rodar testes)

# Build
(comando para fazer build)

# Deploy
(comando para deploy, se manual)

# Lint
(comando para verificar qualidade do código)
```

### MCP e Ferramentas

- **Context7** — usar para documentação atualizada de bibliotecas (ver `ferramentas/context7.md`)
- **LLM Council** — invocar com `convoca o conselho` para decisões caras (ver `ferramentas/llm-council.md`)
- **Graphify** — usar `/graphify .` para mapear codebase legacy ou validar arquitectura (ver `ferramentas/graphify.md`)
- **ultrathink** — accionar raciocínio profundo em decisões arquiteturais

### Estado Atual do Projeto

#### Fases concluídas

- [ ] Fase 0 — Pesquisa
- [ ] Fase 1 — Setup Seguro do Claude Code
- [ ] Fase 2 — Fundação (PLAN + CLAUDE.md)
- [ ] Fase 3 — Testes
- [ ] Fase 4 — Implementação
- [ ] Fase 5 — Otimização
- [ ] Fase 6 — Interface
- [ ] Fase 7 — Deploy

#### Features implementadas

- [ ] (feature 1)
- [ ] (feature 2)

#### Pendências

- (o que falta fazer)

### Erros Conhecidos da IA

> SEÇÃO CRÍTICA — Atualizar TODA VEZ que a IA alucinar ou errar.
> Isso evita que o mesmo erro se repita.

| Data | Erro | Correção | Contexto |
|------|------|----------|----------|
| | | | |

Exemplo:
| 2026-03-09 | IA usou import de módulo que não existe | Explicar que só usar imports nativos do framework | Tentou importar lib não instalada |

### Workflow de Commit

- Commits separados por arquivo ou contexto lógico
- Mensagens em (PT-BR / PT-PT / EN), imperativo, curtas
- Antes de commitar, revisar próprio código procurando erros óbvios
- Pre-commit hooks: (lint, testes, etc.)

### O que NÃO fazer

(Lista de proibições explícitas para este projeto)

- (ex: "Não rodar migrations destrutivas sem confirmação")
- (ex: "Não fazer push para main sem PR")
- (ex: "Não criar arquivos de teste a não ser que pedido explicitamente")

### Override

Quando precisar discutir alternativas, debater trade-offs ou questionar decisões, peça explicitamente. Por padrão, executar com o que foi pedido.

---

## Notas Importantes

- (Qualquer contexto adicional que ajude a IA a trabalhar melhor)
- (Decisões tomadas que não são óbvias)
- (Links úteis para documentação)

---

**Sinais de que estas diretrizes estão funcionando:** menos mudanças desnecessárias nos diffs, menos reescritas por overcomplicação, perguntas de clarificação chegam antes da implementação em vez de depois dos erros.
