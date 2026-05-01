# Template: PLAN.md

> Copiar, renomear para PLAN.md, e preencher ANTES de escrever qualquer código.
> Este documento é a planta do projeto. Se algo é ambíguo aqui, a IA vai alucinar.

---

# PLAN.md — [Nome do Projeto]

## 1. Visão Geral

**O que é:** (1-2 frases)

**Para quem:** (público-alvo)

**Problema que resolve:** (dor do utilizador)

**Como resolve:** (proposta de valor)

---

## 2. Funcionalidades (User Stories)

### Essenciais (MVP)

- Como [utilizador], quero [ação] para [benefício]
- Como [utilizador], quero [ação] para [benefício]
- Como [utilizador], quero [ação] para [benefício]

### Desejáveis (pós-MVP)

- Como [utilizador], quero [ação] para [benefício]

### Futuras (não fazer agora)

- (listar para não esquecer, mas NÃO implementar neste ciclo)

---

## 3. Arquitetura

### Visão de alto nível

```
[Descrever ou desenhar em ASCII a arquitetura geral]

Exemplo:
┌─────────┐     ┌─────────┐     ┌──────────┐
│ Frontend │────▶│   API   │────▶│ Database │
└─────────┘     └─────────┘     └──────────┘
```

### Serviços / Módulos

| Módulo | Responsabilidade | Tecnologia |
|--------|-----------------|------------|
| | | |

---

## 4. Decisões Arquiteturais

| Decisão | Escolha | Alternativas consideradas | Justificativa |
|---------|---------|---------------------------|---------------|
| Framework | | | |
| Banco de dados | | | |
| Deploy | | | |
| Autenticação | | | |

---

## 5. Modelo de Dados (simplificado)

```
Exemplo:
User: id, name, email, created_at
Post: id, title, slug, content, author_id, published_at
```

---

## 6. Fora de Escopo

(Listar explicitamente o que NÃO será feito neste ciclo)

---

## 7. Cronograma (estimativa por fases)

| Fase | Descrição | Estimativa |
|------|-----------|------------|
| 0 | Coleta e inteligência | |
| 1 | Isolamento | |
| 2 | Fundação (PLAN + CLAUDE.md) | |
| 3 | Testes | |
| 4 | Implementação | |
| 5 | Otimização | |
| 6 | Interface e conteúdo | |
| 7 | Deploy e CI/CD | |
