---
name: akita-method
description: "Método estruturado para iniciar e executar projetos de software com IA como par de programação. Baseado no 'Akita Way' (Anti-Vibe Coding + Extreme Programming). Use esta skill SEMPRE que o utilizador quiser criar um novo projeto de software, site, aplicação, SaaS, API ou qualquer sistema — especialmente se envolver IA como ferramenta de desenvolvimento. Também acionar quando o utilizador mencionar: 'novo projeto', 'começar do zero', 'criar um site', 'montar uma aplicação', 'planejamento de projeto', 'CLAUDE.md', 'PLAN.md', 'TDD com IA', 'pair programming com IA', 'Anti-Vibe Coding', 'método Akita', ou pedir ajuda para estruturar qualquer projeto antes de começar a programar."
---

# Akita Method — Skill de Projeto Estruturado com IA

Método para criar projetos de software do zero à produção usando IA como par de programação com disciplina de engenharia sênior. Anti-Vibe Coding: a IA nunca lidera, ela executa sob o controlo do engenheiro humano.

## Princípio Fundamental

> "O dev monta o esqueleto. A IA coloca os órgãos."

A IA só toca em código DEPOIS que o planejamento está completo. Nenhuma linha de código é gerada antes do esqueleto estar blindado.

## Quando usar esta Skill

- Utilizador quer criar um novo projeto (site, app, SaaS, API, bot, etc.)
- Utilizador quer reestruturar um projeto existente com método
- Utilizador pede ajuda para planear antes de programar
- Qualquer cenário onde a IA vai gerar código para um projeto

## Filosofia (lembrar sempre)

1. **Disciplina > Intuição** — Não aceitar código sem entender, não pular etapas
2. **TDD obrigatório** — Testes ANTES do código. Sem testes, cada mudança é uma aposta
3. **Pair Programming** — Humano = Navegador (quê + porquê), IA = Piloto (como)
4. **Desapego do código** — Se a IA erra, explicar o erro, não corrigir à mão
5. **Documentação viva** — CLAUDE.md é atualizado a cada erro e decisão
6. **One-shot prompt é mito** — Refinamento iterativo, cada prompt é um commit

---

## Fluxo Completo (7 Fases)

### FASE 0 — Coleta e Inteligência (pré-projeto)

Antes de qualquer coisa, coletar e organizar todas as informações:

**Ações:**
1. Entrevistar o utilizador sobre o projeto (objetivo, público, funcionalidades)
2. Criar `DADOS-PROJETO.md` com todas as informações coletadas
3. Sugerir pesquisas complementares se necessário (mercado, SEO, concorrência)
4. Discutir opções de ferramentas/stack com justificativas
5. Criar `DECISOES-STACK.md` com escolhas justificadas

**Template:** Ler `templates/DADOS-PROJETO-TEMPLATE.md` nesta pasta da skill.

**Entregável:** Documentação completa do projeto antes de qualquer código.

---

### FASE 1 — Isolamento (AI Jail)

Garantir ambiente seguro para o agente trabalhar.

**Para projetos em Claude.ai (sem terminal):**
- Definir claramente os limites do projeto nos ficheiros de contexto
- Não misturar ficheiros de projetos diferentes

**Para projetos com Claude Code (terminal):**
- Criar container Docker isolado
- Instalar agente DENTRO do container
- Verificar que o agente não acessa fora do /workspace

**Nota:** Se o utilizador não tem Docker ou não usa terminal, adaptar. O princípio é isolamento — mesmo que seja só organização de pastas.

---

### FASE 2 — Fundação (ZERO código)

O dia mais crítico. Tudo documentado ANTES de qualquer código.

**Ações (em ordem):**

1. **Criar PLAN.md** usando o template desta skill
   - Objetivo do projeto
   - User stories / funcionalidades
   - Decisões arquiteturais com justificativas
   - Diagramas de alto nível (se necessário)

2. **Criar CLAUDE.md** usando o template desta skill (200+ linhas)
   - Visão geral da arquitetura
   - Stack tecnológica com versões exatas
   - TODAS as variáveis de ambiente
   - Estrutura de diretórios com descrição de cada pasta
   - Regras de código e qualidade
   - Regras de domínio/negócio
   - Seção vazia "Erros Conhecidos da IA"

3. **Criar estrutura de diretórios** (sem código de negócio)

4. **Criar Docker Compose** (se aplicável)

**Templates:** Ler `templates/PLAN-TEMPLATE.md` e `templates/CLAUDE-MD-TEMPLATE.md`

**Regra absoluta:** NENHUMA linha de código de negócio nesta fase.

**Entregável:** PLAN.md + CLAUDE.md + estrutura de pastas vazia.

---

### FASE 3 — Testes (TDD Puro)

Escrever TODOS os testes antes de qualquer implementação.

**Ações:**
1. Para cada feature do PLAN.md, escrever testes
2. Usar mocks para componentes que não existem ainda
3. Primeiro prompt ao agente: "escreva os testes para [feature]"
4. Se a IA sugerir implementação sem teste: RECUSAR
5. Organizar testes por categoria

**Categorias de teste recomendadas:**
- **Build** — o projeto compila/builda sem erros
- **Funcionalidade** — cada feature faz o que promete
- **Segurança** — dados sensíveis não são expostos
- **Qualidade** — padrões de código seguidos (lint, formatação)
- **Integração** — serviços se comunicam corretamente

**Template:** Ler `templates/TESTES-BASE.md` para exemplos por tipo de projeto.

**Regra:** TODOS os testes devem FALHAR (Red). Se algum passa, está mal escrito.

**Entregável:** Suite de testes completa, todos falhando.

---

### FASE 4 — Implementação

Agora sim, o agente escreve código. Guiado pelos testes.

**Ações:**
1. Implementar feature por feature, na ordem do PLAN.md
2. Após cada feature, rodar testes
3. Se feature nova surgir: PRIMEIRO teste, DEPOIS código
4. Não se preocupar com performance/otimização (isso é Fase 5)

**Prompt padrão:**
> "Temos [N] testes falhando. Implemente [feature X] seguindo as regras do CLAUDE.md. Após implementar, rode os testes."

**Regra:** Todo código DEVE ter teste correspondente. Código sem teste = não existe.

**Entregável:** Código funcional, todos os testes passando (Green).

---

### FASE 5 — Otimização e Refatoração

Melhorar sem quebrar.

**Ações:**
1. Identificar gargalos de performance
2. Refatorar código gerado pela IA (funciona mas está feio)
3. Quebrar ficheiros grandes em módulos
4. Rodar testes após CADA mudança
5. Atualizar CLAUDE.md com decisões de refatoração

**Para sites/frontends:** Rodar Lighthouse, garantir > 90 nas 4 métricas.
**Para APIs:** Testar tempos de resposta, verificar N+1 queries.
**Para qualquer projeto:** Verificar bundle size, dependências desnecessárias.

**Entregável:** Código otimizado, testes continuam passando.

---

### FASE 6 — Interface e Conteúdo

Polir a camada de apresentação.

**Ações:**
1. Implementar interface do utilizador (frontend, CLI, bot, API docs)
2. Criar/polir conteúdo (textos, artigos, copywriting)
3. Testar fluxo completo de ponta a ponta
4. Ajustes de design, responsive, acessibilidade

**Entregável:** Interface finalizada, conteúdo pronto.

---

### FASE 7 — Deploy com CI/CD

Colocar em produção com pipeline automatizada.

**Ações (em ordem):**
1. Criar pipeline de CI/CD (GitHub Actions, etc.)
2. Adicionar: lint → testes → build → deploy
3. Configurar ambiente de produção
4. Configurar domínio e SSL
5. Fazer o primeiro deploy
6. Verificar que o pipeline funciona (push → testa → deploya)

**Template:** Ler `templates/CI-CD-TEMPLATE.md` para exemplos.

**Entregável:** Projeto em produção, CI/CD funcionando.

---

## Regras Transversais (aplicar SEMPRE)

### Desapego do Código
Se a IA gera código errado:
1. NÃO corrigir manualmente
2. Explicar o erro no prompt
3. Documentar no CLAUDE.md seção "Erros Conhecidos da IA"
4. Deixar a IA corrigir

### Documentação Contínua
- Toda decisão arquitetural → CLAUDE.md
- Todo erro da IA → CLAUDE.md
- Toda mudança de escopo → PLAN.md
- O CLAUDE.md é a memória persistente do projeto

### Prompt Refinement
- Nunca esperar resultado perfeito no primeiro prompt
- Cada ajuste de prompt é uma iteração valiosa
- Ser específico: "Akita nunca diz 'talvez'" nível de detalhe

---

## Adaptação por Tipo de Projeto

| Tipo | Fase 0 | Fase 1 | Testes foco | Deploy |
|------|--------|--------|-------------|--------|
| Site estático | Dados cliente + SEO | Pasta isolada | Build, SEO, acessibilidade | Vercel/Netlify |
| SaaS/App | Pesquisa mercado | Docker container | Funcionalidade, integração, segurança | VPS + Kamal |
| API | Docs de endpoints | Docker container | Endpoints, auth, rate limit | VPS ou serverless |
| Bot | Fluxos de conversa | Sandbox | Comandos, respostas, edge cases | Cloud function |

---

## Ficheiros Template

Os templates estão na pasta `templates/` desta skill. Ler o template relevante ANTES de criar cada documento:

- `templates/DADOS-PROJETO-TEMPLATE.md` — Coleta de informações do projeto
- `templates/PLAN-TEMPLATE.md` — Estrutura do PLAN.md
- `templates/CLAUDE-MD-TEMPLATE.md` — Estrutura do CLAUDE.md
- `templates/TESTES-BASE.md` — Exemplos de testes por tipo de projeto
- `templates/CI-CD-TEMPLATE.md` — Exemplos de pipelines

---

## Checklist Rápido (para referência)

- [ ] Fase 0: Dados coletados, pesquisas feitas, stack decidida
- [ ] Fase 1: Ambiente isolado e funcional
- [ ] Fase 2: PLAN.md + CLAUDE.md completos, zero código
- [ ] Fase 3: Testes escritos, todos falhando (Red)
- [ ] Fase 4: Código implementado, todos os testes passando (Green)
- [ ] Fase 5: Código otimizado e refatorado
- [ ] Fase 6: Interface e conteúdo finalizados
- [ ] Fase 7: CI/CD funcionando, projeto em produção
