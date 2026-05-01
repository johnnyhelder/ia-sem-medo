---
description: Lê CLAUDE.md + NOW.md e mostra estado do projeto
argument-hint: ""
---

# /super-power:status

Resumo rápido do projeto. Útil ao retomar trabalho ou abrir nova sessão.

## O que fazer

### 1. Ler ficheiros de contexto

Se existirem, ler:
- `CLAUDE.md` (raiz)
- `NOW.md` (raiz)
- `PLAN.md` (raiz)

### 2. Mostrar resumo estruturado

Formato:

```
╔══════════════════════════════════════════════════════╗
║  Projeto: [nome do projeto]
╠══════════════════════════════════════════════════════╣

  Stack:    [linguagem + framework principal]
  Idioma:   [PT-BR / PT-PT / EN]

  Fase actual: [N — nome da fase]

  Fases concluídas:
    [✓] 0 — Pesquisa
    [✓] 1 — Setup Seguro
    [ ] 2 — Fundação
    [ ] 3 — Testes
    ...

  Última sessão: [data do NOW.md]
    O que foi feito:
      - [item 1]
      - [item 2]

  Próximo passo:
    [extraído do NOW.md]

  Bloqueios:
    [extraído do NOW.md, ou "nenhum"]

  Erros conhecidos da IA: [N entradas no CLAUDE.md]

╚══════════════════════════════════════════════════════╝

Comando sugerido:
  [recomendação baseada no próximo passo]
```

### 3. Se faltar contexto

Se NÃO existir `CLAUDE.md`:
> "Este projeto ainda não tem CLAUDE.md. Comece com `/super-power:research` ou `/super-power:plan`."

Se existir CLAUDE.md mas não NOW.md:
> "CLAUDE.md existe mas NOW.md não. Vou criar agora baseado no estado actual."
> (criar NOW.md vazio)

## Regras

- Resposta concisa (máximo 30 linhas).
- Se algo está bloqueado há mais de 7 dias (data no NOW.md), destacar em amarelo.
- Se a Fase 3 (testes) não foi feita mas há código (Fase 4): ALERTA vermelho — projeto sem rede de segurança.

## Referência

- Estado do projeto está em CLAUDE.md secção "Estado Atual do Projeto"
- Handoff entre sessões está em NOW.md
