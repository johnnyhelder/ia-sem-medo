# 07 — O Desafio dos 7 Dias

> "Eu preciso que todos vocês passem por uma experiência: uma IMERSÃO DE UMA SEMANA completamente DESAPEGADA do código, usando uma IA como pair programming, do zero até a produção. Vai por mim, até vocês fazerem, não vão entender. Depois, muda tudo." — Fábio Akita

## Antes de começar

- Este é um projeto **Build to Learn** — não é para ganhar dinheiro, é para aprender
- Pode ser feito em paralelo com o trabalho (1-3h por dia)
- Projeto PEQUENO — um site pessoal, um blog, uma calculadora, um bot
- Se um dia não couber, quebre em dois (dia 4.1, 4.2)

---

## Dia 1 — Setup Seguro do Claude Code

**Objetivo:** Configurar o ambiente onde o agente vai trabalhar

- Criar uma pasta para o projeto
- Instalar as ferramentas necessárias (Node, Python, etc.)
- Instalar o `claude-code-super-power` (`curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash`)
- Abrir Claude Code na pasta e rodar `/super-power:research` para começar
- Configurar `.claude/settings.json` (o instalador cria um base que pode ajustar)
- (Opcional, projetos de alto risco) Configurar Docker como isolamento extra

**Entregável:** Ambiente funcional, agente configurado, pronto para o Dia 2.

---

## Dia 2 — Fundação (Zero Código)

**Objetivo:** Planejar TUDO antes de escrever código

- Escolher o projeto
- Escrever o que ele precisa fazer (funcionalidades)
- Decidir que ferramentas usar (e por quê)
- Preencher o **PLAN.md** (use o [template](../templates/PLAN-TEMPLATE.md))
- Preencher o **CLAUDE.md** (use o [template](../templates/CLAUDE-MD-TEMPLATE.md))
- Criar a estrutura de pastas (sem código)

**Regra:** NENHUMA linha de código. Apenas documentar e planejar.

**Entregável:** PLAN.md + CLAUDE.md completos.

---

## Dia 3 — Testes

**Objetivo:** Escrever todos os testes ANTES do código

- Para cada funcionalidade, escrever o teste
- Primeiro prompt à IA: "escreva os testes para [funcionalidade]"
- Se a IA sugerir código de implementação: **RECUSAR**
- Usar mocks para coisas que ainda não existem

**Regra:** Todos os testes devem FALHAR. Se algum passa, está mal escrito.

**Entregável:** Suite de testes, todos falhando (Red).

---

## Dia 4 — Código

**Objetivo:** Fazer os testes passarem

- Pedir à IA para implementar cada funcionalidade
- Após cada implementação, rodar os testes
- Lembrou de funcionalidade nova? Primeiro teste, depois código
- Não se preocupar com performance (isso é o Dia 5)

**Regra:** Todo código deve ter teste. Código sem teste = não existe.

**Entregável:** Tudo funcionando, todos os testes passando (Green).

---

## Dia 5 — Melhoria

**Objetivo:** Otimizar e refatorar sem quebrar nada

- Identificar o que está lento ou feio
- Pedir à IA para refatorar
- Rodar testes após CADA mudança
- Verificar performance (Lighthouse para sites)

**Entregável:** Código limpo e otimizado, testes continuam passando.

---

## Dia 6 — Interface

**Objetivo:** Polir a experiência do utilizador

- Design, textos, responsive
- Testar o fluxo completo de ponta a ponta
- Ajustes finais de usabilidade

**Entregável:** Projeto visualmente finalizado.

---

## Dia 7 — Deploy

**Objetivo:** Colocar no ar com pipeline automática

- Criar pipeline de CI/CD (use o [template](../templates/CI-CD-TEMPLATE.md))
- Configurar: lint → testes → build → deploy
- Configurar domínio e SSL
- Fazer o deploy!

**Entregável:** Projeto em produção, CI/CD funcionando.

---

## Depois dos 7 dias

Segundo o Akita, depois dessa imersão a sua visão sobre usar IA para programar muda completamente. Você deixa de **torcer para funcionar** e passa a **saber que funciona** — porque os testes provam.

O céu é o limite. Continue adicionando funcionalidades, testando, melhorando. A fundação foi construída da forma correta.

---

## Dicas

- **Não precisa ser 7 dias corridos.** 1-2 horas por dia, no seu ritmo.
- **O projeto deve ser pequeno.** Não tente fazer um SaaS completo.
- **Permita-se errar.** Isso é um Build to Learn.
- **Documente tudo** — inclusive os erros. O CLAUDE.md é sua memória.
- **Compartilhe sua experiência** — abra uma Issue neste repositório!
