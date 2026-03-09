# 01 — Filosofia: Por que a IA Precisa de Disciplina

> Baseado nos princípios de Fábio Akita. Todos os créditos em [CREDITOS.md](../CREDITOS.md).

## Quem é Fábio Akita

Fabio Makoto Akita (@AkitaOnRails) é engenheiro de software desde o início dos anos 1990. Cofundador da Codeminer 42, organizador de 9 edições da Rubyconf Brasil (2008-2016), autor do blog akitaonrails.com desde 2006, e criador do canal "Akitando" no YouTube com 149 episódios. Atualmente mantém a newsletter "The M.Akita Chronicles".

## Princípio central: Você é o arquiteto, não o pedreiro

Na construção civil, o arquiteto desenha e o pedreiro executa. No software, o código-fonte É a planta. Você é o arquiteto que toma as decisões. A IA e os computadores são os "operários" que executam.

## Anti-Vibe Coding: disciplina > intuição

**Vibe Coding** = aceitar tudo que a IA gera sem ler, sem entender, sem testar. Jogar prompts e torcer para funcionar.

**Anti-Vibe Coding** = usar IA com método. Você precisa de MAIS conhecimento, não menos, para usar IA bem. A IA é subordinada a você, nunca o contrário.

### O que NÃO funciona:
- **O mito do One-Shot Prompt** — "Crie um SaaS" não produz software de qualidade
- **O paradigma da Lootbox** — jogar prompt e torcer para a IA sortear a resposta certa
- **A Big Ball of Mud** — sem arquitetura, a IA produz código ingovernável
- **Erros só em produção** — sem testes, cada mudança é uma aposta

### O que funciona:
- Planejamento antes de qualquer código
- Testes como rede de segurança obrigatória
- O dev entrega o esqueleto (arquitetura), a IA preenche os órgãos (implementação)
- Cada ajuste de prompt é um commit versionado
- Documentação constante no CLAUDE.md

## Extreme Programming (XP) + IA

O XP (Kent Beck, anos 90) é o framework natural para programar com IA:

1. **Ciclos curtos** — mitiga alucinações antes que escalem
2. **Pair Programming** — a IA é o "par" (piloto), você é o navegador
3. **TDD** — testes ANTES do código garantem que a IA não diverge
4. **Refatoração constante** — a IA escreve rápido, você refatora rápido
5. **Design incremental** — builds pequenos, nunca "one-shot"

## Build to Earn vs Build to Learn

- **Build to Earn**: projeto que paga seu salário. NÃO é lugar para experimentação
- **Build to Learn**: projeto paralelo para aprender. Onde você pratica novas técnicas
- **Erro comum**: usar o projeto de produção para experimentar
