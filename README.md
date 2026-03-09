# 🛡️ IA Sem Medo

### Um método prático para criar projetos com Inteligência Artificial — sem virar refém dela.

[![Licença MIT](https://img.shields.io/badge/licença-MIT-green.svg)](LICENSE)
[![PRs Bem-vindos](https://img.shields.io/badge/PRs-bem--vindos-brightgreen.svg)](CONTRIBUTING.md)

---

## O que é isso aqui?

Este repositório é um **método passo a passo** para você criar projetos de software usando IA como parceira — não como muleta.

Se você já tentou usar ChatGPT, Claude ou Cursor para criar algo e sentiu que:

- 🤯 "A IA fez um monte de código e eu não entendi nada"
- 😰 "Funcionou... mas eu tenho medo de mexer e quebrar tudo"
- 🔄 "Cada vez que peço uma coisa nova, outra para de funcionar"
- 🎰 "Parece que estou jogando na loteria — às vezes funciona, às vezes não"

...então este método é para você.

---

## De onde veio isso?

Este método foi **extraído e adaptado** dos princípios do [Fábio Akita](https://akitaonrails.com) — um dos programadores mais respeitados do Brasil, com mais de 30 anos de experiência. Em 2026, ele demonstrou publicamente como criou **4 aplicações em 8 dias** usando IA, com **1.323 testes automatizados** como rede de segurança.

O que ele mostrou não tem nada a ver com "vibe coding" (jogar prompts e torcer para funcionar). É o oposto: **disciplina, planejamento e engenharia** aplicados ao uso de IA.

Nós estudamos os artigos dele, vídeos, newsletter, participações em podcasts — e organizamos tudo num método prático que qualquer pessoa pode seguir. Veja como fizemos isso em [COMO-FOI-FEITO.md](COMO-FOI-FEITO.md).

> **Todos os créditos e referências ao trabalho original do Akita estão em [CREDITOS.md](CREDITOS.md).**

---

## Para quem é?

✅ Você quer criar um site, app ou sistema usando IA, mas quer fazer **do jeito certo**

✅ Você já programa e quer usar IA **sem perder o controle** do projeto

✅ Você está começando e quer aprender **o método antes da ferramenta**

✅ Você já tentou "vibe coding" e se frustrou com os resultados

❌ Não é para quem quer um prompt mágico que faz tudo sozinho — isso não existe.

---

## Os 12 Princípios

| # | Princípio | Em uma frase |
|---|-----------|-------------|
| 1 | **Você é o arquiteto** | A IA escreve código, você toma as decisões |
| 2 | **Planeje antes de pedir** | Nenhum prompt antes do planejamento estar pronto |
| 3 | **Teste antes de criar** | Escreva os testes primeiro, depois peça o código |
| 4 | **Documente tudo** | Seu CLAUDE.md é a memória do projeto |
| 5 | **Um passo de cada vez** | Nada de "crie um SaaS" num único prompt |
| 6 | **Se a IA errar, explique** | Nunca corrija à mão — ensine a IA |
| 7 | **Isole o ambiente** | A IA não precisa de acesso a tudo |
| 8 | **Automatize a segurança** | Testes + CI/CD = rede de segurança |
| 9 | **Priorize o que importa** | Faça o essencial primeiro, o resto depois |
| 10 | **Refatore com confiança** | Com testes, mudar código não dá medo |
| 11 | **Deploy não é o fim** | É o começo da melhoria contínua |
| 12 | **O método é replicável** | Funciona para o próximo projeto também |

---

## Como usar em 5 minutos

### 1. Clone este repositório

```bash
git clone https://github.com/johnnyhelder/ia-sem-medo.git
```

### 2. Copie os templates para o seu projeto

```bash
cp ia-sem-medo/templates/* seu-projeto/
```

### 3. Preencha o PLAN.md

Abra o `PLAN-TEMPLATE.md` e responda as perguntas sobre o seu projeto. Não precisa ser perfeito — precisa ser honesto.

### 4. Preencha o CLAUDE.md

Abra o `CLAUDE-MD-TEMPLATE.md` e documente as decisões técnicas. Essa é a "memória" que a IA vai usar.

### 5. Siga o Desafio dos 7 Dias

Leia o [`metodo/07-desafio-7-dias.md`](metodo/07-desafio-7-dias.md) e faça um projeto pequeno seguindo o método completo. **Depois disso, tudo muda.**

> 📖 Para um guia mais detalhado, leia o [GUIA-RAPIDO.md](GUIA-RAPIDO.md)

---

## O que tem neste repositório

```
ia-sem-medo/
│
├── 📖 metodo/                    O MÉTODO COMPLETO
│   ├── 01-filosofia.md           Por que a IA precisa de disciplina
│   ├── 02-fluxo-completo.md      As 7+1 fases: do zero à produção
│   ├── 03-tdd-com-ia.md          Testes como rede de segurança
│   ├── 04-pair-programming-ia.md Você pensa, a IA executa
│   ├── 05-gestao-estimativas.md  Como gerir projetos de verdade
│   ├── 06-ferramentas-stack.md   O que usar (e o que evitar)
│   └── 07-desafio-7-dias.md      O desafio prático — comece por aqui!
│
├── 📋 templates/                 TEMPLATES PRONTOS (copie e use)
│   ├── PLAN-TEMPLATE.md          Planta do projeto
│   ├── CLAUDE-MD-TEMPLATE.md     Memória do agente de IA
│   ├── DADOS-PROJETO-TEMPLATE.md Coleta de informações
│   ├── TESTES-BASE.md            Exemplos de testes por tipo de projeto
│   └── CI-CD-TEMPLATE.md         Pipelines de deploy automatizado
│
├── 🔧 skill/                    SKILL PARA CLAUDE (uso avançado)
│   └── SKILL.md                  Instrução que o Claude segue automaticamente
│
├── 💡 exemplos/                  CASOS PRÁTICOS
│   ├── projeto-novo-do-zero.md   Como criar um projeto novo com o método
│   └── resgate-projeto-existente.md Como blindar um projeto que já existe
│
├── 📚 fontes/                    MATERIAL DE PESQUISA
│   ├── README.md                 Índice das fontes originais
│   └── pesquisa-resumo.md        Resumo da pesquisa sobre o método Akita
│
├── COMO-FOI-FEITO.md             A história de como criamos este método
├── CREDITOS.md                   Homenagem ao Akita + referências
├── GUIA-RAPIDO.md                Versão express para começar agora
├── CONTRIBUTING.md               Como contribuir
└── LICENSE                       MIT — use à vontade
```

---

## O Desafio dos 7 Dias

O coração deste repositório é o **Desafio dos 7 Dias** — uma imersão prática proposta pelo Akita onde você cria um projeto do zero até a produção usando IA, mas com método.

| Dia | Foco | O que você faz |
|-----|------|----------------|
| 1 | Ambiente | Monta o ambiente seguro para a IA trabalhar |
| 2 | Fundação | Planeja TUDO antes de escrever código |
| 3 | Testes | Escreve os testes ANTES do código |
| 4 | Código | Agora sim, a IA escreve — guiada pelos testes |
| 5 | Melhoria | Otimiza e refatora com segurança |
| 6 | Interface | Polir a cara do projeto |
| 7 | Deploy | Colocar no ar com pipeline automática |

> 💡 Não precisa ser 7 dias corridos. Pode ser 1-2 horas por dia, no seu ritmo. O importante é seguir a ordem.

Leia o guia completo: [`metodo/07-desafio-7-dias.md`](metodo/07-desafio-7-dias.md)

---

## "Mas eu não sei programar..."

Tudo bem. Este método foi pensado para funcionar em diferentes níveis:

- **Se você está começando:** Siga o Desafio dos 7 Dias com um projeto simples (um site pessoal, por exemplo). Os templates vão guiar você.
- **Se você já programa:** Use os templates e a Skill para acelerar seus projetos com mais segurança.
- **Se você lidera equipes:** Os princípios de gestão e estimativas vão mudar como você vê produtividade.

A diferença entre "usar IA" e "usar IA com método" é a diferença entre **torcer para funcionar** e **saber que funciona**.

---

## Contribua

Encontrou algo que pode melhorar? Tem uma experiência para compartilhar? Quer adicionar templates para uma nova stack?

Leia o [CONTRIBUTING.md](CONTRIBUTING.md) e participe.

---

## Créditos

Este trabalho é uma **homenagem e adaptação** dos princípios de **Fábio Akita** — e não existiria sem o conteúdo que ele disponibiliza publicamente há décadas.

Todos os créditos, referências e links para os conteúdos originais estão em [CREDITOS.md](CREDITOS.md).

---

## Licença

MIT — use, modifique, distribua. Só mantenha os créditos.

---

<p align="center">
  <strong>"Ganha quem comete o penúltimo erro."</strong><br>
  <em>— Tartakower (adaptado para projetos com IA)</em>
</p>

<p align="center">
  Feito com método por <a href="https://johnnyhelder.com">Johnny Helder</a>
</p>
